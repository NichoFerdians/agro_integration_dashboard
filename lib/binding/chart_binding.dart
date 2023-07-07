import 'package:agro_integration_dashboard/controller/chart_controller.dart';
import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:get/get.dart';

class ChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<ChartController>(() => ChartController());
  }
}
