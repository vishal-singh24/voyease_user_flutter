import 'package:get/get.dart';
import 'package:voyease_frontend/screens/auth/mobile_no_otp_screen/controller/mobile_no_otp_screen_controller.dart';

class MobileNoOtpScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MobileNoOtpScreenController>(()=>MobileNoOtpScreenController());
  }
  
}