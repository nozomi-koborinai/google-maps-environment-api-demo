import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_environment_api_demo/domain/postal_code_info.dart';

import '../../../domain/destination.dart';

/// Firebase Firestore に保存される引越し先のドキュメントモデル
class DestinationDocument {
  DestinationDocument({
    required this.destinationId,
    required this.postalCode,
    required this.result,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String destinationId;
  final String postalCode;
  final PostalCodeInfo result;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory DestinationDocument.fromJson(
          String destinationId, Map<String, dynamic> json) =>
      DestinationDocument(
        destinationId: destinationId,
        postalCode: json['postalCode'] as String,
        result: PostalCodeInfo.fromJson(json['result']),
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'postalCode': postalCode,
        'result': result,
        'safetyMetadata': {},
        'status': {},
        'createdAt': createdAt,
        'updatedAt': FieldValue.serverTimestamp(),
      };
}

/// [DestinationDocument] の拡張
extension on DestinationDocument {
  /// [DestinationDocument] -> [Destination]
  Destination toDestination() => Destination(
        destinationId: destinationId,
        postalCode: postalCode,
        postalCodeInfo: result,
        createdAt: createdAt,
      );
}
