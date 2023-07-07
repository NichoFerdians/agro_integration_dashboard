import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:agro_integration_dashboard/controller/login_controller.dart';
import 'package:agro_integration_dashboard/provider/data_source.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AppDataSource>(() => AppDataSource());
    Get.lazyPut<GlobalController>(() => GlobalController());
  }
}
