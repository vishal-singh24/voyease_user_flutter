import 'package:get/get.dart';
import 'package:voyease_frontend/screens/settings/user_profile_screen/controller/user_profile_screen_controller.dart';

class UserProfileScreenBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<UserProfileScreenController>(()=>UserProfileScreenController());
  }
  
}