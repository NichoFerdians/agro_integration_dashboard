import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/restan/chart/kombinasi_pencapaian_panen_tonase_controller.dart';
import 'package:agro_integration_dashboard/controller/restan/restan_controller.dart';

import 'package:get/get.dart';

class RestanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<RestanController>(() => RestanController());
    Get.lazyPut<KombinasiPencapaianPanenTonaseController>(
        () => KombinasiPencapaianPanenTonaseController());
  }
}
