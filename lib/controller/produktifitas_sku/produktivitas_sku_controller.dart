import 'package:agro_integration_dashboard/controller/produktifitas_sku/chart/bar_produktivitas_sku_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class ProduktivitasSKUController extends GetxController {
  static ProduktivitasSKUController get to => Get.find();

  late FusionCharts barProduktifitasSKU;

  // Chart List
  final BarProduktivitasSKUController bar = Get.find();

  @override
  void onInit() {
    super.onInit();

    barProduktifitasSKU = bar.fusionChart;
  }
}
