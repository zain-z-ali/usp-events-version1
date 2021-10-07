import 'package:flutter/material.dart';
// import 'package:version1_0/view/directions_model.dart';
// import 'package:version1_0/view/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-18.1416, 178.4419),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
          ),
    );
  }
}
           