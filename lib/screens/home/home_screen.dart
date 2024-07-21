import "dart:async";
import "dart:math";

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:sheet/sheet.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/screens/home/widgets/tour_guid_selection.dart";
import "package:voyease_frontend/widgets/app_map.dart";
import "package:voyease_frontend/widgets/form/input_field.dart";

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SheetController _sheetController;
  late Completer<GoogleMapController> _mapController;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    _sheetController = SheetController();
    _mapController = Completer<GoogleMapController>();
    super.initState();
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  void _moveToCurrentLocation() async {
    try {
      var position = await _determinePosition();
      double lat = position.latitude;
      double long = position.longitude;
      LatLng location = LatLng(lat, long);
      GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: location, zoom: 500)));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AppMap(controller: _mapController, initialPosition: _initialPosition),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            child: InputField(
              placeholder: "Search",
              prefixIcon: Icon(Icons.search_outlined),
              suffixIcon: Icon(Icons.mic_none_outlined),
            ),
          ),
          FloatingButtons(
            controller: _sheetController,
            onClick: _moveToCurrentLocation,
          ),
          GuideSelectionSheet(
            controller: _sheetController,
          )
        ],
      ),
    );
  }
}

class GuideSelectionSheet extends StatelessWidget {
  const GuideSelectionSheet({
    super.key,
    required this.controller,
  });

  final SheetController controller;

  @override
  Widget build(BuildContext context) {
    return Sheet(
      controller: controller,
      backgroundColor: Colors.transparent,
      initialExtent: 300,
      physics: const SnapSheetPhysics(
        stops: [0.4, 1],
      ),
      minExtent: 20,
      child: AnimatedBuilder(
          animation: controller.animation,
          builder: (context, _) {
            final bool sheetBar = controller.animation.value > 0.95;
            return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: sheetBar ? 1 : 0),
                duration: const Duration(milliseconds: 200),
                builder: (context, t, _) {
                  final double radius =
                      Tween<double>(begin: 24.0, end: 0.0).transform(t);
                  final double appBarOpacity =
                      Tween<double>(begin: 0.0, end: 1.0).transform(t);

                  final Color? barColor = ColorTween(
                          begin: AppColors.darkBlue,
                          end: AppColors.white.withOpacity(0))
                      .transform(t);

                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                    child: Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 5,
                            width: 90,
                            color: barColor,
                          ),
                          Opacity(
                            opacity: appBarOpacity,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.relativeAnimateTo(0.4,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeIn);
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                  iconSize: 28,
                                )
                              ],
                            ),
                          ),
                          const Expanded(child: TourGuidSelection()),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key, required this.controller, this.onClick});

  final SheetController controller;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double height =
        mediaQuery.size.height - mediaQuery.padding.top - kToolbarHeight;
    return AnimatedBuilder(
        animation: controller.animation,
        builder: (BuildContext context, Widget? child) {
          return Positioned(
              right: 0,
              bottom: height * min(0.4, controller.animation.value),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.white,
                      onPressed: onClick,
                      child: const Icon(Icons.location_searching),
                    ),
                  ],
                ),
              ));
        });
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
