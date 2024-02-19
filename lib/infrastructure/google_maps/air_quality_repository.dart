import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_environment_api_demo/domain/app_exception.dart';
import 'package:google_maps_environment_api_demo/domain/env.dart';
import 'package:google_maps_environment_api_demo/domain/google_maps/air_quality.dart';
import 'package:http/http.dart' as http;

/// [AirQualityRepository] のインスタンスを提供する [Provider]
final airQualityRepositoryProvider = Provider<AirQualityRepository>(
  (ref) => AirQualityRepository(
    apiKey: ref.read(envProvider).googleMapsApiKey,
  ),
);

/// 大気質データを提供する Repository
class AirQualityRepository {
  AirQualityRepository({
    required this.apiKey,
  });

  final String apiKey;

  Future<AirQuality> fetch({
    required double latitude,
    required double longitude,
  }) async {
    final apiUrl =
        'https://airquality.googleapis.com/v1/currentConditions:lookup?key=$apiKey';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'location': {
          'latitude': latitude,
          'longitude': longitude,
        },
        'languageCode': 'ja',
      }),
    );

    if (response.statusCode == 200) {
      final apiResponse = json.decode(response.body);
      print(apiResponse);
      return AirQuality.fromJson(apiResponse);
    }

    throw AppException('Failed to fetch air quality data: ${response.body}');
  }
}
