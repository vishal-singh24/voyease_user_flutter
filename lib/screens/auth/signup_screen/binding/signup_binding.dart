import 'package:get/get.dart';
import 'package:voyease_frontend/screens/auth/signup_screen/controller/signup_controller.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(()=>SignupController());
  }
  
}