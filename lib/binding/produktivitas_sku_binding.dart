import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/produktifitas_sku/chart/bar_produktivitas_sku_controller.dart';
import 'package:agro_integration_dashboard/controller/produktifitas_sku/produktivitas_sku_controller.dart';

import 'package:get/get.dart';

class ProduktivitasSKUBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<ProduktivitasSKUController>(() => ProduktivitasSKUController());
    Get.lazyPut<BarProduktivitasSKUController>(
        () => BarProduktivitasSKUController());
  }
}
