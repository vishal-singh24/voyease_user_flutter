import 'package:get/get.dart';
import 'package:voyease_frontend/screens/auth/login_screen/controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(()=>LoginController());
  }
  
}