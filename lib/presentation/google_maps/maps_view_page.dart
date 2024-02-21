// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_environment_api_demo/domain/google_maps/air_quality.dart';
import 'package:google_maps_environment_api_demo/presentation/mixin/error_handler_mixin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/services.dart' show rootBundle;

import '../../application/google_maps/get_destination_info_usecase.dart';
import '../../domain/destination.dart';

class MapsViewPage extends ConsumerStatefulWidget {
  const MapsViewPage({super.key});

  @override
  ConsumerState<MapsViewPage> createState() => _MapsViewPageState();
}

class _MapsViewPageState extends ConsumerState<MapsViewPage>
    with ErrorHandlerMixin {
  final Completer<GoogleMapController> mapController = Completer();

  final LatLng _center = const LatLng(35.630152, 139.74044);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: '郵便番号で検索（例: 100-0000）',
            fillColor: Colors.white.withOpacity(0.8), // 背景を少し透明に
            filled: true,
            contentPadding: const EdgeInsets.all(0),
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          onSubmitted: (value) async {
            await run(
              context,
              action: () async {
                final result =
                    await ref.read(getDestinationInfoUsecaseProvider).execute(
                          postalCode: value,
                        );
                _showModalBottomSheet(context, result);
              },
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // 影をなくす
      ),
      body: GoogleMap(
        minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (controller) async {
          mapController.complete(controller);
          // final value = await rootBundle.loadString(Assets.json.mapStyle);
          // final futureController = await mapController.future;
          // await futureController.setMapStyle(value);
        },
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 13.0,
        ),
      ),
    );
  }

  // ハーフモーダルを表示する関数
  void _showModalBottomSheet(
    BuildContext context,
    (Destination, AirQuality) info,
  ) {
    final postalCodeInfo = info.$1.postalCodeInfo;
    final airQuality = info.$2;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.air_sharp),
                title: Text('大気質レベル: ${airQuality.indexes[0].aqi}'),
                subtitle: Text('カテゴリ: ${airQuality.indexes[0].category}'),
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: Text('エリア: ${postalCodeInfo.area}'),
                subtitle: Text('郵便番号: ${postalCodeInfo.postalCode}'),
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title:
                    Text('不動産中央価格: ${postalCodeInfo.realEstate.medianPrice}円'),
                subtitle: Text('価格範囲: ${postalCodeInfo.realEstate.range}'),
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: Text(
                    '1Kアパート平均賃貸価格: ${postalCodeInfo.rentalPrices.aptAverage}円/月'),
              ),
              ListTile(
                leading: const Icon(Icons.policy_sharp),
                title: Text('犯罪発生率: ${postalCodeInfo.crimeRate}件'),
              ),
              ListTile(
                leading: const Icon(Icons.family_restroom),
                title: Text('街の雰囲気: ${postalCodeInfo.atmosphere}'),
                subtitle: Text('年齢層:  ${postalCodeInfo.demographics.ageGroup}'),
              ),
              ListTile(
                leading: const Icon(Icons.nature_sharp),
                title: Text(
                    '天災の歴史: ${postalCodeInfo.disasterPrevention.geotechnicalInfo}'),
                subtitle: Text('防災・地盤情報: ${postalCodeInfo.naturalDisasters}'),
              ),
            ],
          ),
        );
      },
    );
  }
}
