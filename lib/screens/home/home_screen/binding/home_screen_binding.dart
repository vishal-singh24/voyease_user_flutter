import 'package:get/get.dart';
import 'package:voyease_frontend/screens/home/home_screen/controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(()=>HomeScreenController());
  }
}