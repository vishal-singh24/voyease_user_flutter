import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sheet/sheet.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/screens/home/home_screen/controller/home_screen_controller.dart';
import 'package:voyease_frontend/screens/home/tour_guide_selection/view/tour_guid_selection.dart';
import 'package:voyease_frontend/widgets/app_map.dart';
import 'package:voyease_frontend/widgets/form/input_field.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        initState: (_) {},
        builder: (_) {
          return SafeArea(
            child: Stack(
              children: [
                AppMap(
                  controller: controller.mapController,
                  initialPosition: HomeScreenController.initialPosition,
                  markers: controller.markers,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  child: InputField(
                    placeholder: "Search",
                    prefixIcon: Icon(Icons.search_outlined),
                    suffixIcon: Icon(Icons.mic_none_outlined),
                  ),
                ),
                controller.loading.value
                    ? const Center(
                        child: CupertinoActivityIndicator(radius: 30))
                    : const SizedBox.shrink(),
                FloatingButtons(
                  controller: controller.sheetController,
                  onClick: () => controller.startLocationUpdates(),
                ),
                GuideSelectionSheet(
                  controller: Get.find<HomeScreenController>(),
                ),
              ],
            ),
          );
        });
  }
}

class GuideSelectionSheet extends StatelessWidget {
  const GuideSelectionSheet({
    super.key,
    required this.controller,
  });
  final HomeScreenController controller;
  //final SheetController controller;

  @override
  Widget build(BuildContext context) {
    Position? currentLocation = controller.currentPosition.value;
    return Sheet(
      controller: controller.sheetController,
      backgroundColor: Colors.transparent,
      initialExtent: 300,
      physics: const SnapSheetPhysics(
        stops: [0.4, 1],
      ),
      minExtent: 20,
      child: AnimatedBuilder(
        animation: controller.sheetController.animation,
        builder: (context, _) {
          final bool sheetBar =
              controller.sheetController.animation.value > 0.95;
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
                                controller.sheetController.relativeAnimateTo(
                                    0.4,
                                    duration: const Duration(milliseconds: 200),
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
            },
          );
        },
      ),
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
          ),
        );
      },
    );
  }
}
