import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:galleryimage/galleryimage.dart";
import "package:voyease_frontend/configs/app_colors.dart";
import "package:voyease_frontend/widgets/app_top_nav_bar.dart";
import "package:voyease_frontend/widgets/item_image_slider.dart";

@RoutePage()
class ShopDetailScreen extends StatelessWidget {
  const ShopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> menuImages = [
      "https://s3-alpha-sig.figma.com/img/d647/ed67/e65e6ae2ae7ca0c4b513637b168bb009?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z0YHw1STp53SwdPl6gdkl4Zal4~NLOA6wN3OTEbJ9lNRQxaxPV~yGo7bnk2YDb4KXk52KF5wJuvjrNlMMRGmqX4m5-Cr35yiqzylG-TqkJ3Q-P2asanpKBlZpe6LbOkv93tUH4hcWY~YqMkj2I50NIiOSmWAT~ToNK4ffWaq8dbb080JL8neKLxZGlg3NZiECFhp-fwgYN3Yqvo5PJ0Wop~vl8EwWjfq-OWTBex1f64Z3F~65lbpfmYgToTihXtTku8sYQ7PxMExvszqVN8uhd4wpdZgiNUHpPTWFbF~AR1HKmyJiEE7bG7~EQ~UVbRlyDHC3gSuqg3qdpvc5j4Tvg__",
      "https://s3-alpha-sig.figma.com/img/8d0b/8de7/b6ee2659a053e4f48461dad653680d60?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=H9DwkfQWKIrVOdx6kXmp1Uz9lDc8onxseUc860malfXipfbw6NkK0hI1o8YkTbjWZkovmNZEFguj-FtkCx-7cR0UHo10UL73cn3iu40MlUFh3zRf6qZtceoszCpJqc5Xv~oxXyb0g1m5Axx3u88LOuBSXSMGqnKrByxfLLXF1bLP4qFyf7fozNBhU5~SMwI-YW2GR-9gl0h~9C1VDQS8~DARSKrMrZtNkW-a-4WUGITdQ1HQqgOkdKcilpQ09jhaLgLWDXFR7vD~DcQOl-SUoEZ8j1AvEj~K-FcR01yaeLE1gIX3wLLjW34W38F8CkE1M1HdRAYljsRwNevlyDW8Qw__",
      "https://s3-alpha-sig.figma.com/img/275e/6a06/70c280e65e1878ef85b80ddcb783cb91?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=deublxWK8IV-kfAeRIrh7n8xpJ5h~dxwRRPY~slB-pvCzv2QwgSZ-D~EO6iH7apILQsAlK8xvk6Co~9Bh6AC9JGe2cTamseDqd5LV3IhzqY6sOpFGy47EUpsYG48sathcsni3VdTmFIstzf-IUDEgzClMw0u15H3lJQB~Jk1Xg-n-ug24lT2havbsuEdOj8ZRAJJ80pSvtiOfpgRowskTlaVx7kcnrMFCT6IAl48BniD-Rb~ikVs76MUlznsOeORIwDf34GqulOGqbcS1cNkGA91Msi-afkQet3v0WM9fHCQSQ5OK85RkQ-F9bO3f7nuaxI~r5f~VmHhBoJxOxo-Zg__",
      "https://s3-alpha-sig.figma.com/img/72a1/1e42/41b7d7981e2ac9793e56686f1c307207?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GtykJR46AXgaHuC8z~-rKfozKCYp~3ieXDBMeb6aFc-lJPiNpNmRiW4XfBngCsvn7r1fafJesHgfTSEE64uuhbxqkLV26Nk0ar2kq3RbwV01P6C5OFQ6ys8DrUjTaB2vuOuaq7ptUnFZp8FtOlSWbEpGSdf~7OLuhl0-B0c1xWCsPNHDAnmjGxysjWzXPwPfubKvxdVC1S-J~3CX6bnp9ac9E2T44zQmAtD4KBVbiHqZ8tgdz7b1R1~6uY-2uqdpiINHQkc9qlSLqK-G4L834jlQ5XErt66nxt~NTYZuYcG22cyI2fPNL-f83cHk4i1R--jOsGFQqQg3ouQ5H7Z3ZQ__",
      "https://s3-alpha-sig.figma.com/img/b120/f16f/2c2ed94db90d9eee67021e4c926a4170?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nrDClD8RBUZhTVwgwXhKZ85kEMec1Z7bygjp-QZPER33PcMM4pZgWfGxDGvyHVabl9k-pBVajHg6OMdN7R044IMGbkB~31ukW~FIbfAmA6cnllTqmjw1rVDxZG4m3hvgG5RF1~52dd5~-yM6vTj-10Yo4UVqH9jX4uDOf10-zCw5i1SGIJIqOEW-id7VNd1oGAdbcGcP03VBXoQnCuIqLyf~itTCyAp3CbZc1~VBQPT9CY2VMFDcj9b4JmKS4vzrFU5AJIqqCQI9osC5UK2YOYZKuybr9gw5B3Z3K1Ak1apd354TKwlN-bNP~BgGN4ohmd0HeRlEZOJvG0O0dZ18Ag__",
    ];

    return Scaffold(
      appBar: const AppTopNavBar(
        title: Text(
          "Shop Name",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemImageSlider(
              images: [
                "assets/images/bowl.png",
                "assets/images/bowl.png",
                "assets/images/bowl.png",
                "assets/images/bowl.png",
                "assets/images/bowl.png",
                "assets/images/bowl.png",
                "assets/images/bowl.png",
                "assets/images/bowl.png",
                "assets/images/bowl.png",
                "assets/images/bowl.png",
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Address"),
                  const SizedBox(height: 18),
                  const Text(
                      "H-345, Address of the shop, Locality Name, State, District, Pincode - 212011"),
                  const SizedBox(height: 18),
                  FilledButton.icon(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                        backgroundColor: AppColors.lightGreen),
                    label: const Text(
                      "Visit",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    iconAlignment: IconAlignment.end,
                    icon: const Icon(Icons.arrow_outward_outlined),
                  ),
                  const SizedBox(height: 30),
                  const Text("Address"),
                  const SizedBox(height: 18),
                  const Text(
                      "Lorem ipsum dolor sit amet consectetur. Eleifend cras porttitor vel"
                      " auctor et in sodales pharetra. Egestas accumsan elementum eu aliquam."
                      " Nisl porttitor eget sed in mi vestibulum vitae sodales. Ut vitae arcu"
                      " auctor dui viverra magnis ultrices maecenas pellentesque."),
                  const SizedBox(height: 30),
                  const Text("Menu"),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: GalleryImage(
                      showAppBar: false,
                      imageUrls: menuImages,
                      closeWhenSwipeDown: true,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
