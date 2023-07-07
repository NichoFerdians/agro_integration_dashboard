import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/kualitas_panen/chart/pie_kualitas_panen_controller.dart';
import 'package:agro_integration_dashboard/controller/kualitas_panen/chart/stack_kualitas_panen_per_sku_controller.dart';
import 'package:agro_integration_dashboard/controller/kualitas_panen/kualitas_panen_controller.dart';

import 'package:get/get.dart';

class KualitasPanenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<KualitasPanenController>(() => KualitasPanenController());
    Get.lazyPut<PieKualitasPanenController>(() => PieKualitasPanenController());
    Get.lazyPut<StackKualitasPanenPerSKUController>(
        () => StackKualitasPanenPerSKUController());
  }
}
