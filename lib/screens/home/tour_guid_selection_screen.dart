import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyease_frontend/configs/app_colors.dart';
import 'package:voyease_frontend/widgets/selection_button.dart';

class TourGuidSelection extends StatelessWidget {
  const TourGuidSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var langugages = [
      "Hindi",
      "English",
      "Spanish",
      "German",
      "French",
      "Japanese",
      "Tamil",
      "Telugu"
    ];
    var groupSize = ["1-5", "6-4", "15+"];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 34),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
              color: AppColors.primaryLight,
              height: 40,
              child: Row(
                children: [
                  const Text(
                    "What are you looking for?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset("assets/images/map.svg")
                ],
              ),
            ),
            const SelectionButton(
              leftText: "Tour Buddy",
              margin: EdgeInsets.only(left: 38, top: 30),
            ),
            const SelectionButton(
              leftText: "Tour Guide",
              margin: EdgeInsets.only(left: 38, top: 15),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.only(left: 33),
              width: size.width,
              child: const Text(
                "Preferences",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              color: AppColors.primaryLight,
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset("assets/images/emoji_language.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset("assets/images/dictionary_language.svg"),
                ],
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              crossAxisCount: 3,
              childAspectRatio: 2.5,
              mainAxisSpacing: 25,
              crossAxisSpacing: 40,
              shrinkWrap: true,
              children: List.generate(
                langugages.length,
                (index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.25),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      langugages[index],
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              color: AppColors.primaryLight,
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Group Size",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset("assets/icons/group.svg"),
                ],
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              crossAxisCount: 3,
              childAspectRatio: 2.5,
              mainAxisSpacing: 25,
              crossAxisSpacing: 40,
              shrinkWrap: true,
              children: List.generate(
                groupSize.length,
                (index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.25),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      groupSize[index],
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: AppColors.primaryLight,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Select you guide",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset("assets/icons/person_filled.svg"),
                    ],
                  ),
                  const SelectionButton(
                    leftText: "Elite Guide",
                    rightText: "Rates",
                    iButton: true,
                    margin: EdgeInsets.only(top: 18),
                  ),
                  const SelectionButton(
                    leftText: "Permium Guide",
                    rightText: "Rates",
                    iButton: true,
                    margin: EdgeInsets.only(top: 8),
                  ),
                  const SelectionButton(
                    leftText: "Standard Guide",
                    rightText: "Rates",
                    iButton: true,
                    margin: EdgeInsets.only(top: 8, bottom: 22),
                  ),
                  Text(
                    "Recommended",
                    style: TextStyle(color: AppColors.textGray),
                  ),
                  const SelectionButton(
                    leftText: "Tour Buddy",
                    rightText: "Rates",
                    iButton: true,
                    margin: EdgeInsets.only(top: 15),
                  ),
                ],
              ),
            ),
            Container(
              height: 34,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/icons/paytm.png"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Paytm"),
                          ],
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    color: AppColors.textGray,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/offers.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Offers",
                            ),
                          ],
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                ),
                child: Text(
                  "Book Now",
                  style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                ),
                iconAlignment: IconAlignment.end,
                icon: SvgPicture.asset("assets/icons/recent.svg"),
                label: Text(
                  "Book For tomorrow",
                  style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
