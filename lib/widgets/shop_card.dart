import 'package:flutter/material.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
    required this.image,
    required this.title,
    this.stars = 3,
    this.onClick,
  });

  final String image;
  final String title;
  final int stars;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Column(
            children: [
              SizedBox(
                height: 215,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.darkBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (i) {
                            return Icon(
                              Icons.star,
                              color: i > stars - 1
                                  ? AppColors.white
                                  : const Color(0XFFFFD700),
                            );
                          },
                        ).toList(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
