import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:voyease_frontend/configs/app_colors.dart';

class ItemImageSlider extends StatefulWidget {
  const ItemImageSlider({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<ItemImageSlider> createState() => _ItemImageSliderState();
}

class _ItemImageSliderState extends State<ItemImageSlider> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              carouselController: _controller,
              items: widget.images.map((img) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlay: true,
                height: 250,
                viewportFraction: 1,
              ),
            ),
            Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: widget.images.length,
                effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.white,
                    dotColor: AppColors.white,
                    dotHeight: 6,
                    dotWidth: 6,
                    spacing: 3,
                    expansionFactor: 4.5),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 65,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 5,
              childAspectRatio: 3 / 4,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _controller.jumpToPage(index);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
