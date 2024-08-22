import 'package:get/get.dart';
import 'package:voyease_frontend/screens/main_screen/controllers/main_screen_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(()=>MainScreenController());
  }
  
}