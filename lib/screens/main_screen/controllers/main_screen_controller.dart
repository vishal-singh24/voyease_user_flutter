import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var currentIndex = 0.obs; // RxInt for reactivity

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
