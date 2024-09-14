import "dart:async";

import "package:flutter/material.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";

class AppMap extends StatelessWidget {
  const AppMap(
      {super.key, required this.initialPosition, required this.controller,this.markers=const {}});

  final CameraPosition initialPosition;
  final Completer<GoogleMapController> controller;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      mapType: MapType.normal,
      myLocationButtonEnabled:false,
      myLocationEnabled: true,
      initialCameraPosition: initialPosition,
      onMapCreated: (GoogleMapController ctrl) {
        controller.complete(ctrl);
      },
      // markers: markers,
    );
  }
}
