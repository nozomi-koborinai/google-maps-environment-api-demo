import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_environment_api_demo/domain/destination.dart';
import 'package:google_maps_environment_api_demo/domain/postal_code_info.dart';
import 'package:google_maps_environment_api_demo/infrastructure/firebase/destination_repository.dart';

import 'common/mixin/run_usecase_mixin.dart';

/// [GetDestinationInfoUsecase] のインスタンスを提供する [Provider]
final getDestinationInfoUsecase = Provider<GetDestinationInfoUsecase>(
  GetDestinationInfoUsecase.new,
);

/// 引越し先のデータを取得する Usecase クラス
class GetDestinationInfoUsecase with RunUsecaseMixin {
  GetDestinationInfoUsecase(this.ref);

  final Ref ref;

  /// 引越し先郵便番号からその詳細情報を取得する
  Future<Destination> execute({
    required String postalCode,
  }) async {
    final destination = Destination(
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
    );

    return await run(
      ref,
      () async {
        final repository = ref.read(destinationRepositoryProvider);
        return await repository.fetch(await repository.add(destination));
      },
      isLottieAnimation: true,
    );
  }
}
