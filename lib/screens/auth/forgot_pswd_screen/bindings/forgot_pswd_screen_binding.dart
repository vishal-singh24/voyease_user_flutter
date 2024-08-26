import 'package:get/get.dart';
import 'package:voyease_frontend/screens/auth/forgot_pswd_screen/controller/forgot_pswd_screen_controller.dart';

class ForgotPswdScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgotPswdScreenController>(()=>ForgotPswdScreenController());
  }
  
}