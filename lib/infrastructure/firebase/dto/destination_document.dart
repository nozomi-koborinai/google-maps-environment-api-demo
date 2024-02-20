import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_environment_api_demo/domain/postal_code_info.dart';
import 'dart:convert';

import '../../../domain/destination.dart';

/// Firebase Firestore に保存される引越し先のドキュメントモデル
class DestinationDocument {
  DestinationDocument({
    required this.destinationId,
    required this.postalCode,
    required this.output,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String destinationId;
  final String postalCode;
  final String output;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory DestinationDocument.fromJson(
          String destinationId, Map<String, dynamic> json) =>
      DestinationDocument(
        destinationId: destinationId,
        postalCode: json['postalCode'] as String,
        output: json['output'] as String,
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'postalCode': postalCode,
        'output': '',
        'safetyMetadata': {},
        'status': {},
        'createdAt': createdAt,
        'updatedAt': FieldValue.serverTimestamp(),
      };
}

/// [DestinationDocument] の拡張
extension DestinationDocumentEx on DestinationDocument {
  /// [DestinationDocument] -> [Destination]
  Destination toDestination() {
    final Map<String, dynamic> resultData = json.decode(output);
    final postalCodeInfo = PostalCodeInfo.fromJson(resultData);
    return Destination(
      destinationId: destinationId,
      postalCode: postalCode,
      postalCodeInfo: postalCodeInfo,
      createdAt: createdAt,
    );
  }
}
