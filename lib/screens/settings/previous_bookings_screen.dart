import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/app_top_nav_bar.dart';
import 'package:voyease_frontend/widgets/common_widgets.dart';

@RoutePage()
class PreviousBookingsScreen extends StatelessWidget {
  const PreviousBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTopNavBar(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: const Text(
                "Previous Bookings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 5),
                // shrinkWrap: true,
                children: List.generate(
                  20,
                  (index) {
                    return Card(
                      name: "Varanasi",
                      date: "24 may, 2024",
                      price: "\$ 1500.00",
                      onViewMore: () {},
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.name,
    required this.date,
    required this.price,
    this.onViewMore,
  });
  final String name;
  final String date;
  final String price;
  final Function()? onViewMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 20, right: 18),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: ShapeDecoration(
          shadows: const [
            BoxShadow(
                offset: Offset(2, 4),
                color: Color(0x60000000),
                blurRadius: 9,
                spreadRadius: 4)
          ],
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(),
              borderRadius: BorderRadius.circular(20))),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                date,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGreen),
              ),
              FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: AppColors.darkBlue,
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  onPressed: onViewMore,
                  child: const Text("view more"))
            ],
          ),
        ],
      ),
    );
  }
}
