import 'package:get/get.dart';
import 'package:voyease_frontend/screens/home/tour_guide_selection/controller/tour_guide_selection_controller.dart';

class TourGuideSelectionBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<TourGuideSelectionController>(()=>TourGuideSelectionController());
  }
}