import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_environment_api_demo/infrastructure/firebase/firebase_providers.dart';

import '../../domain/app_exception.dart';
import '../../domain/destination.dart';
import 'dto/destination_document.dart';

/// [DestinationRepository] のインスタンスを提供する [Provider]
final destinationRepositoryProvider = Provider<DestinationRepository>(
  (ref) => DestinationRepository(
    destinationCollectionRef: ref.watch(destinationCollectionRefProvider),
  ),
);

/// destination コレクションの参照結果を提供する [Provider].
final destinationCollectionRefProvider =
    Provider<CollectionReference<DestinationDocument>>(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('destination')
      .withConverter<DestinationDocument>(
        fromFirestore: (snapshot, _) => DestinationDocument.fromJson(
          snapshot.id,
          snapshot.data()!,
        ),
        toFirestore: (confDoc, options) => confDoc.toJson(),
      ),
);

/// 引越し先のデータを提供する Repository
class DestinationRepository {
  DestinationRepository({
    required this.destinationCollectionRef,
  });

  final CollectionReference<DestinationDocument> destinationCollectionRef;

  /// 引越し先のドキュメントを追加する
  Future<String> add(Destination destination) async {
    try {
      /// 引越し先ドキュメントに郵便番号を登録して、PaLM API トリガーを発火させる
      final doc = await destinationCollectionRef.add(
        DestinationDocument(
          destinationId: '',
          postalCode: destination.postalCode,
          output: '',
        ),
      );

      /// PaLM API による生成が完了するまで待つ
      final palmResult = await waitPaLMResult(documentId: doc.id);
      if (palmResult == null) {
        throw const AppException('PaLM API による生成がタイムアウトしました');
      }
      return doc.id;
    } on FirebaseException catch (e) {
      throw AppException('Firestore へのデータ登録時にエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// 引越し先のドキュメントを取得する
  Future<Destination> fetch(String documentId) async {
    try {
      final snapshot = await destinationCollectionRef.doc(documentId).get();
      if (!snapshot.exists) {
        throw const AppException('ドキュメントが見つかりませんでした');
      }
      return snapshot.data()!.toDestination();
    } on FirebaseException catch (e) {
      throw AppException('Firestore からのデータ取得時にエラーが発生しました: ${e.code}');
    } catch (e) {
      throw AppException('予期しないエラーが発生しました: $e');
    }
  }

  /// PaLM API による生成結果を取得する
  /// 指定したドキュメントの更新が終了するのを待ち続ける
  Future<DocumentSnapshot<DestinationDocument>?> waitPaLMResult({
    required String documentId,
  }) async {
    final snapshots = destinationCollectionRef.doc(documentId).snapshots();
    const timeout = Duration(minutes: 1);
    await for (final snapshot in snapshots.timeout(timeout)) {
      if (snapshot.data()?.output != '') {
        return snapshot;
      }
    }

    // タイムアウトした場合は null を返却する
    return null;
  }
}
