import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sheet/sheet.dart';

class HomeScreenController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  final RxBool loading = false.obs;
  final RxSet<Marker> markers = <Marker>{}.obs;
  final SheetController sheetController = SheetController();
  StreamSubscription<Position>? positionStreamSubscription;
 final Rx<Position?> currentPosition = Rx<Position?>(null);

  static const String googlePlacesApiKey =
      "AIzaSyBlSYDZGIDYQdD_pwmXBp0Ww8Fo11sper0";

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );
  @override
  void onInit() {
    super.onInit();
    startLocationUpdates();
  }

  @override
  void onClose() {
    positionStreamSubscription?.cancel();
    super.onClose();
  }

  void startLocationUpdates() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar('Location Error', 'Location services are disabled.');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Permission Denied', 'Location permissions are denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar('Permission Denied',
            'Location permissions are permanently denied.');
        return;
      }

      positionStreamSubscription =
          Geolocator.getPositionStream().listen((Position position) async {
        LatLng location = LatLng(position.latitude, position.longitude);
        currentPosition.value = position;
        GoogleMapController controller = await mapController.future;

        await controller.animateCamera(
          CameraUpdate.newCameraPosition(
              CameraPosition(target: location, zoom: 19)),
        );

        List<Marker> nearbyPlaces = await fetchNearbyPlaces(location, null);
        markers.addAll(nearbyPlaces);
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to start location updates: $e');
    }
  }

  Future<List<Marker>> fetchNearbyPlaces(
      LatLng location, String? placeType) async {
    const String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

    final queryParameters = {
      'location': '${location.latitude},${location.longitude}',
      'radius': 8000, // Radius in meters
      'key': googlePlacesApiKey,
    };

    if (placeType != null && placeType.isNotEmpty) {
      queryParameters['type'] = placeType;
    }

    final response = await Dio().get(url, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      return results.map((place) {
        return Marker(
          markerId: MarkerId(place['place_id']),
          position: LatLng(
            place['geometry']['location']['lat'],
            place['geometry']['location']['lng'],
          ),
          infoWindow: InfoWindow(
            title: place['name'],
            snippet: place['vicinity'],
          ),
        );
      }).toList();
    } else {
      log('Failed to load places: ${response.statusMessage}');
      return [];
    }
  }
}
