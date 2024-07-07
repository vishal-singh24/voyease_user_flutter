import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:voyease_frontend/widgets/shop_card.dart";

class ShopSlider extends StatelessWidget {
  const ShopSlider({
    super.key,
    required this.items,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items.map(
        (el) {
          return Builder(
            builder: (context) {
              return ShopCard(
                image: el["image"],
                title: el["name"],
                onClick: el["onClick"],
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 250,
        padEnds: false,
        viewportFraction: .9,
        enableInfiniteScroll: false,
      ),
    );
  }
}
