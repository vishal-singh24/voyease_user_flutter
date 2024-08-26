import 'package:get/get.dart';
import 'package:voyease_frontend/screens/auth/enter_otp_screen/controller/enter_otp_screen_controller.dart';

class EnterOtpScreenBinding extends Bindings{
 
  @override
  void dependencies() {
   Get.lazyPut<EnterOtpScreenController>(()=>EnterOtpScreenController());
  }
}