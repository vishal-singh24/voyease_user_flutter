import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/widgets/buttons/secondary_button.dart";
import "package:voyease_frontend/widgets/selection_button.dart";

class TourGuidSelection extends StatelessWidget {
  const TourGuidSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

    return ListView(
      children: [
        const SectionName(
          title: "What are you looking for?",
          icon: Icon(Icons.map_outlined),
        ),
        const SelectionButton(
          leftText: "Tour Buddy",
          margin: EdgeInsets.only(left: 38, top: 30),
        ),
        const SelectionButton(
          leftText: "Tour Guide",
          margin: EdgeInsets.only(left: 38, top: 15),
        ),
        const SizedBox(height: 30),
        const Divider(
          thickness: .5,
          color: Colors.black,
        ),
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.only(left: 33),
          child: const Text(
            "Preferences",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 15),
        const SectionName(
          title: "Language",
          icon: Icon(Icons.language_outlined),
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
        const SizedBox(height: 15),
        const SectionName(
            title: "Group Size", icon: Icon(Icons.groups_2_outlined)),
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
        const SectionName(
            title: "Select your guide", icon: Icon(Icons.person_pin_outlined)),
        // Container(
        //   padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 27),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const SelectionButton(
        //         leftText: "Elite Guide",
        //         rightText: "Rates",
        //         iButton: true,
        //         margin: EdgeInsets.only(top: 18),
        //       ),
        //       const SelectionButton(
        //         leftText: "Permium Guide",
        //         rightText: "Rates",
        //         iButton: true,
        //         margin: EdgeInsets.only(top: 8),
        //       ),
        //       const SelectionButton(
        //         leftText: "Standard Guide",
        //         rightText: "Rates",
        //         iButton: true,
        //         margin: EdgeInsets.only(top: 8, bottom: 22),
        //       ),
        //       Text(
        //         "Recommended",
        //         style: TextStyle(color: AppColors.textGray),
        //       ),
        //       const SelectionButton(
        //         leftText: "Tour Buddy",
        //         rightText: "Rates",
        //         iButton: true,
        //         margin: EdgeInsets.only(top: 15),
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(0, -2))
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
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
                    VerticalDivider(color: AppColors.grey),
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
              const SizedBox(height: 25),
              SecondaryButton(label: "Book Now", onClick: () {}),
              const SizedBox(height: 10),
              SecondaryButton(
                  label: "Book for tomorrow",
                  icon: const Icon(
                    Icons.history_outlined,
                    color: Colors.white,
                  ),
                  onClick: () {}),
            ],
          ),
        )
      ],
    );
  }
}

class SectionName extends StatelessWidget {
  const SectionName({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: AppColors.primaryLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          if (icon != null) icon!
        ],
      ),
    );
  }
}
