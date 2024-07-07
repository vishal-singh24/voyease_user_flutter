import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sheet/sheet.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/screens/home/widgets/tour_guid_selection.dart';
import 'package:voyease_frontend/widgets/app_map.dart';
import 'package:voyease_frontend/widgets/form/input_field.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Stack(
        children: [
          AppMap(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            child: InputField(
              placeholder: "Search",
              prefixIcon: Icon(Icons.search_outlined),
              suffixIcon: Icon(Icons.mic_none_outlined),
            ),
          ),
          GuideSelectionSheet()
        ],
      ),
    );
  }
}

class GuideSelectionSheet extends StatefulWidget {
  const GuideSelectionSheet({
    super.key,
  });

  @override
  State<GuideSelectionSheet> createState() => _GuideSelectionSheetState();
}

class _GuideSelectionSheetState extends State<GuideSelectionSheet> {
  late SheetController _controller;

  @override
  void initState() {
    _controller = SheetController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sheet(
      controller: _controller,
      backgroundColor: Colors.transparent,
      initialExtent: 300,
      physics: const SnapSheetPhysics(
        stops: [0.4, 1],
      ),
      minExtent: 20,
      child: AnimatedBuilder(
          animation: _controller.animation,
          builder: (context, _) {
            final bool sheetBar = _controller.animation.value > 0.95;
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
                                    _controller.relativeAnimateTo(0.4,
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
