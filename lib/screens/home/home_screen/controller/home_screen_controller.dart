import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
  final Rx<Position?> currentPosition = Rx<Position?>(null);
  final TextEditingController searchController = TextEditingController();

  static const String googlePlacesApiKey =
      "AIzaSyBlSYDZGIDYQdD_pwmXBp0Ww8Fo11sper0";

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
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

      // Fetch the current position once
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      LatLng location = LatLng(position.latitude, position.longitude);
      currentPosition.value = position;

      // Move the camera to the current location
      GoogleMapController controller = await mapController.future;
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: location, zoom: 19),
        ),
      );

      // Fetch nearby places based on the current location
      List<Marker> nearbyPlaces = await fetchNearbyPlaces(location, null);
      markers.addAll(nearbyPlaces);
    } catch (e) {
      Get.snackbar('Error', 'Failed to get current location: $e');
    }
  }

  Future<void> searchPlace(String query) async {
    try {
      const String url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      final response = await Dio().get(url, queryParameters: {
        'input': query,
        'key': googlePlacesApiKey,
        'location':
            '${currentPosition.value?.latitude},${currentPosition.value?.longitude}',
        // 'radius':
        //     8000, // Restrict search to a radius around the current location
      });

      if (response.statusCode == 200) {
        List<dynamic> predictions = response.data['predictions'];
        log('Search results: $predictions');
        // Display search results or handle selection
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch places: $e');
    }
  }

  Future<void> fetchPlaceDetails(String placeId) async {
    try {
      final String url =
          'https://maps.googleapis.com/maps/api/place/details/json';
      final response = await Dio().get(url, queryParameters: {
        'place_id': placeId,
        'key': googlePlacesApiKey,
      });

      if (response.statusCode == 200) {
        final result = response.data['result'];
        final lat = result['geometry']['location']['lat'];
        final lng = result['geometry']['location']['lng'];

        LatLng placeLocation = LatLng(lat, lng);

        // Move the map camera to the selected location
        GoogleMapController controller = await mapController.future;
        controller.animateCamera(CameraUpdate.newLatLngZoom(placeLocation, 14));

        // Optionally add a marker to the map
        markers.add(Marker(
          markerId: MarkerId(placeId),
          position: placeLocation,
          infoWindow: InfoWindow(title: result['name']),
        ));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch place details: $e');
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
