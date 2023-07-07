import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/produktivitas_unit/produktivitas_unit_controller.dart';

import 'package:get/get.dart';

class ProduktivitasUnitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<ProduktivitasUnitController>(
        () => ProduktivitasUnitController());
  }
}
