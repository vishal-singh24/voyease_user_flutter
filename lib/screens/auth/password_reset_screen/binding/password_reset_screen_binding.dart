import 'package:get/get.dart';
import 'package:voyease_frontend/screens/auth/password_reset_screen/controller/password_reset_screen_controller.dart';

class PasswordResetScreenBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut<PasswordResetScreenController>(()=>PasswordResetScreenController());
  }
}