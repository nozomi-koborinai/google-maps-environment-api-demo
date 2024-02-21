import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_environment_api_demo/domain/destination.dart';
import 'package:google_maps_environment_api_demo/domain/google_maps/air_quality.dart';
import 'package:google_maps_environment_api_demo/domain/postal_code_info.dart';
import 'package:google_maps_environment_api_demo/infrastructure/firebase/destination_repository.dart';

import '../../infrastructure/google_maps/air_quality_repository.dart';
import '../common/mixin/run_usecase_mixin.dart';

/// [GetDestinationInfoUsecase] のインスタンスを提供する [Provider]
///
/// Presentation Layer にユースケースを注入するために使用され、引越し先の郵便番号を登録したのちに詳細を LLM によって取得する
final getDestinationInfoUsecaseProvider = Provider<GetDestinationInfoUsecase>(
  GetDestinationInfoUsecase.new,
);

/// 引越し先のデータを取得する Usecase クラス
class GetDestinationInfoUsecase with RunUsecaseMixin {
  GetDestinationInfoUsecase(this.ref);

  /// 指定された [Ref] を使用して [GetDestinationInfoUsecase] を構築する
  ///
  /// [Ref] は必要な [Provider] を読み取るために使用される
  final Ref ref;

  /// 引越し先郵便番号からその詳細情報を取得し、合わせて地図情報を取得する
  ///
  /// LLM による取得 + Google Maps API による取得が同期的に行われる
  Future<(Destination, AirQuality)> execute({
    required String postalCode,
  }) async {
    return await run(
      ref,
      () async {
        final destination = await _getDestinationInfo(postalCode);
        final airQuality = await _getMapInfo(
          destination.postalCodeInfo.address.lat,
          destination.postalCodeInfo.address.lng,
        );
        return (destination, airQuality);
      },
      isLottieAnimation: true,
    );
  }

  /// 引越し先郵便番号からその詳細情報を取得する
  Future<Destination> _getDestinationInfo(String postalCode) async {
    final repository = ref.read(destinationRepositoryProvider);
    return await repository.fetch(await repository.add(Destination(
      destinationId: '',
      postalCode: postalCode,
      postalCodeInfo: PostalCodeInfo(
        postalCode: postalCode,
        area: '',
        address: Address(street: '', lat: 0, lng: 0),
        realEstate: RealEstate(medianPrice: 0, range: ''),
        rentalPrices: RentalPrices(aptAverage: ''),
        crimeRate: '',
        atmosphere: '',
        demographics: Demographics(ageGroup: ''),
        naturalDisasters: '',
        disasterPrevention: DisasterPrevention(geotechnicalInfo: ''),
      ),
      createdAt: DateTime.now(),
    )));
  }

  /// 座標から地図情報（大気質レベル）を取得する
  Future<AirQuality> _getMapInfo(double latitude, double longitude) async {
    return await ref.read(airQualityRepositoryProvider).fetch(
          latitude: latitude,
          longitude: longitude,
        );
  }
}
