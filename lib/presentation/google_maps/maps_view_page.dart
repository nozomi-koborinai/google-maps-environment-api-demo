import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../infrastructure/google_maps/air_quality_repository.dart';
import '../app_colors.dart';

class MapsViewPage extends ConsumerStatefulWidget {
  const MapsViewPage({super.key});

  @override
  ConsumerState<MapsViewPage> createState() => _MapsViewPageState();
}

class _MapsViewPageState extends ConsumerState<MapsViewPage>
    with AutomaticKeepAliveClientMixin {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    ref.read(airQualityRepositoryProvider).fetch(
          latitude: 35.630152,
          longitude: 139.74044,
        );
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: Image.asset(
          'assets/images/ca_logo_white_big.png',
          width: 180,
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
