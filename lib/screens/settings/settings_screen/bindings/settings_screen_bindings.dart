import 'package:get/get.dart';
import 'package:voyease_frontend/screens/settings/settings_screen/controller/settings_screen_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingsScreenController>(()=>SettingsScreenController());
  }
  
}