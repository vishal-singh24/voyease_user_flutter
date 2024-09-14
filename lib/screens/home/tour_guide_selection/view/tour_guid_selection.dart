import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:geolocator/geolocator.dart";
import "package:get/get.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/screens/home/tour_guide_selection/controller/tour_guide_selection_controller.dart";
import "package:voyease_frontend/widgets/buttons/secondary_button.dart";
import "package:voyease_frontend/widgets/selection_button.dart";

class TourGuidSelection extends GetView<TourGuideSelectionController> {
  const TourGuidSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final TourGuideSelectionController controller =
        Get.put(TourGuideSelectionController());
    var groupSizes = ["1-5", "6-14", "15+"];
    var timeSlots = ["7am-9am", "9am-11am", "11am-1pm"];

    return GetBuilder<TourGuideSelectionController>(
        init: TourGuideSelectionController(),
        initState: (_) {},
        builder: (_) {
          if (controller == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.languages.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              const SectionName(
                title: "What are you looking for?",
                icon: Icon(Icons.map_outlined),
              ),
              SelectionButton(
                leftText: "Tour Buddy",
                margin: const EdgeInsets.only(left: 38, top: 30),
                isSelected: controller.selectedOption.value == "Tour Buddy",
                onClick: () {
                  controller.selectOption("Tour Buddy");
                  controller.toggleAdditionalButtons(false);
                },
              ),
              SelectionButton(
                leftText: "Tour Guide",
                margin: const EdgeInsets.only(left: 38, top: 15),
                isSelected: controller.selectedOption.value == "Tour Guide",
                onClick: () {
                  controller.selectOption("Tour Guide");
                },
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                crossAxisCount: 3,
                childAspectRatio: 2.5,
                mainAxisSpacing: 25,
                crossAxisSpacing: 45,
                shrinkWrap: true,
                children: List.generate(
                  controller.languages.length,
                  (index) {
                    final language = controller.languages[index];
                    final isSelected =
                        controller.selectedLanguages.contains(language);
                    return GestureDetector(
                      onTap: () => controller.languageSelection(language),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.25),
                          borderRadius: BorderRadius.circular(4),
                          color:
                              isSelected ? AppColors.secondary : Colors.white,
                        ),
                        child: Text(
                          controller.languages[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                crossAxisCount: 3,
                childAspectRatio: 2.5,
                mainAxisSpacing: 25,
                crossAxisSpacing: 40,
                shrinkWrap: true,
                children: List.generate(
                  groupSizes.length,
                  (index) {
                    final groupSize = groupSizes[index];
                    final isSelected =
                        controller.selectedGroupSize.value == groupSize;
                    return GestureDetector(
                      onTap: () => controller.selectGroupSize(groupSize),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.25),
                          borderRadius: BorderRadius.circular(4),
                          color:
                              isSelected ? AppColors.secondary : Colors.white,
                        ),
                        child: Text(
                          groupSizes[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: controller.selectedOption.value == "Tour Guide",
                child: const SectionName(
                    title: "Select your guide",
                    icon: Icon(Icons.person_pin_outlined)),
              ),
              Visibility(
                visible: controller.selectedOption.value == "Tour Guide",
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            controller.selectTourGuide("PREMIUM_GUIDE"),
                        child: SelectionButton(
                          leftText: "PREMIUM GUIDE",
                          rightText: "Rates",
                          iButton: true,
                          margin: const EdgeInsets.only(top: 8),
                          isSelected: controller.tourGuideSelection.value ==
                              "PREMIUM_GUIDE",
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            controller.selectTourGuide("STANDARD_GUIDE"),
                        child: SelectionButton(
                          leftText: "STANDARD_GUIDE",
                          rightText: "Rates",
                          iButton: true,
                          margin: const EdgeInsets.only(top: 8, bottom: 22),
                          isSelected: controller.tourGuideSelection.value ==
                              "STANDARD_GUIDE",
                        ),
                      ),
                      Text(
                        "Recommended",
                        style: TextStyle(color: AppColors.textGray),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.selectOption("Tour Buddy");
                          controller.toggleAdditionalButtons(false);
                        },
                        child: const SelectionButton(
                          leftText: "Tour Buddy",
                          rightText: "Rates",
                          iButton: true,
                          margin: EdgeInsets.only(top: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: controller.showAdditionalButtons.value == true,
                child: const SectionName(
                  title: "Booking Time Slot",
                ),
              ),
              Visibility(
                visible: controller.showAdditionalButtons.value == true,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 40,
                  shrinkWrap: true,
                  children: List.generate(
                    timeSlots.length,
                    (index) {
                      final timeslot = timeSlots[index];
                      final isSelected =
                          controller.selectedTimeSlot.value == timeslot;
                      return GestureDetector(
                        onTap: () => controller.timeSlotSelection(timeslot),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.25),
                            borderRadius: BorderRadius.circular(4),
                            color:
                                isSelected ? AppColors.secondary : Colors.white,
                          ),
                          child: Text(
                            timeSlots[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.25),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, -2))
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
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
                    Visibility(
                      visible: controller.showAdditionalButtons.value == false,
                      child: SecondaryButton(
                          label: "Book Now",
                          onClick: () async {
                            // DateTime now = DateTime.now();
                            // DateTime fourPM =
                            //     DateTime(now.year, now.month, now.day, 16, 0);
                            // if (now.isAfter(fourPM)) {
                            //   showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return AlertDialog(
                            //         title: const Text(
                            //           "Booking Unavailable",
                            //           style: TextStyle(color: Colors.red),
                            //         ),
                            //         content: const Text(
                            //             "You cannot book for today. Booking is available for tomorrow only."),
                            //         actions: <Widget>[
                            //           TextButton(
                            //             child: const Text("OK"),
                            //             onPressed: () {
                            //               Navigator.of(context).pop();
                            //             },
                            //           ),
                            //         ],
                            //       );
                            //     },
                            //   );
                            // } else {
                            if (controller.selectedOption.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Please choose one either Tour Guide or Tour Buddy"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            if (controller.selectedLanguages.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text("Please select one or more languages"),
                                backgroundColor: Colors.red,
                              ));
                              return;
                            }
                            if (controller.selectedGroupSize.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Please Select Your Group Size"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            if (controller.selectedOption.value ==
                                "Tour Guide") {
                              if (controller.tourGuideSelection.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Please Select Guide Type"),
                                  backgroundColor: Colors.red,
                                ));
                                return;
                              }
                            }
                            Position position =
                                await Geolocator.getCurrentPosition();
                            controller.postBooking(position.latitude,
                                position.longitude, true, context);
                            //}
                          }),
                    ),
                    Visibility(
                        visible:
                            controller.showAdditionalButtons.value == false,
                        child: const SizedBox(height: 10)),
                    Visibility(
                      visible:
                          controller.showAdditionalButtons.value == false &&
                              controller.selectedOption.value != "Tour Buddy",
                      child: SecondaryButton(
                          label: "Book for tomorrow",
                          icon: const Icon(
                            Icons.history_outlined,
                            color: Colors.white,
                          ),
                          onClick: () {
                            controller.toggleAdditionalButtons(true);
                          }),
                    ),
                    Visibility(
                      visible: controller.showAdditionalButtons.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SecondaryButton(
                              label: "Back",
                              onClick: () {
                                controller.toggleAdditionalButtons(false);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SecondaryButton(
                              label: "Book Trip",
                              onClick: () async {
                                if (controller.selectedOption.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Please choose one either Tour Guide or Tour Buddy"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                                if (controller.selectedLanguages.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Please select one or more languages"),
                                    backgroundColor: Colors.red,
                                  ));
                                  return;
                                }
                                if (controller.selectedGroupSize.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Please Select Your Group Size"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                if (controller.selectedOption.value ==
                                    "Tour Guide") {
                                  if (controller.tourGuideSelection.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Please Select Guide Type"),
                                      backgroundColor: Colors.red,
                                    ));
                                    return;
                                  }
                                }
                                if (controller.selectedTimeSlot.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Please select a time slot"),
                                    backgroundColor: Colors.red,
                                  ));
                                }

                                Position position =
                                    await Geolocator.getCurrentPosition();
                                controller.postBooking(position.latitude,
                                    position.longitude, false, context);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
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
