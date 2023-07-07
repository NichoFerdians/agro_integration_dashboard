import 'package:agro_integration_dashboard/controller/chart_controller.dart';
import 'package:agro_integration_dashboard/controller/chart_example_controller.dart';
import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/provider/data_source.dart';
import 'package:get/get.dart';
import 'package:agro_integration_dashboard/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<ChartController>(() => ChartController());
    Get.lazyPut<ChartExampleController>(() => ChartExampleController());
    Get.lazyPut<AppDataSource>(() => AppDataSource());
  }
}
