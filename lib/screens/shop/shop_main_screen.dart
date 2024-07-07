import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/core/routing/app_router.dart';
import 'package:voyease_frontend/widgets/shop_slider.dart';

@RoutePage()
class ShopMainScreen extends StatelessWidget {
  const ShopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: const SafeArea(
        child: Column(
          children: [
            TopBar(),
            MainBody(),
          ],
        ),
        // child: Stack(
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.only(top: 40),
        //       child: const TopItemSlider(),
        //     ),
        //     TopBar(),
        //     const ShopSheet()
        //   ],
        // ),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List items = [
      {
        "image": "assets/images/hand-sandwich.png",
        "name": "Shop name",
        "onClick": () {
          context.navigateNamedTo(ShopDetailRoute.name);
        }
      },
      {
        "image": "assets/images/hand-sandwich.png",
        "name": "Shop name",
      },
      {
        "image": "assets/images/hand-sandwich.png",
        "name": "Shop name",
      },
      {
        "image": "assets/images/hand-sandwich.png",
        "name": "Shop name",
      },
    ];

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: ShapeDecoration(
                  color: const Color.fromRGBO(239, 111, 83, 0.22),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                child: const Text(
                  "Top Rated Shops",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Food",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(height: 10),
              ShopSlider(items: items),
              const SizedBox(height: 20),
              const Text("Sarees",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(height: 10),
              ShopSlider(items: items),
              const SizedBox(height: 20),
              const Text("Handicrafts",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(height: 10),
              ShopSlider(items: items)
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 4),
              color: Color(0x60000000),
              blurRadius: 4,
              spreadRadius: 0)
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterCard(label: "Categories"),
          VerticalDivider(
            thickness: 1,
            color: Colors.black54,
          ),
          FilterCard(label: "Sort"),
        ],
      ),
    );
  }
}

class FilterCard extends StatelessWidget {
  const FilterCard({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          // padding: const EdgeInsets.all(10),
          child: Text(label)),
    );
  }
}
