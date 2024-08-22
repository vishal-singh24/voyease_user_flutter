import 'package:get/get.dart';
import 'package:voyease_frontend/screens/auth/sign_up_verify_screen/controllers/sign_up_verify_screen_controller.dart';

class SignUpVerifyScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpVerifyScreenController>(()=>SignUpVerifyScreenController());
  }
  
}