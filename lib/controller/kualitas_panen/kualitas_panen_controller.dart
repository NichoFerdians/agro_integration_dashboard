import 'package:agro_integration_dashboard/controller/kualitas_panen/chart/pie_kualitas_panen_controller.dart';
import 'package:agro_integration_dashboard/controller/kualitas_panen/chart/stack_kualitas_panen_per_sku_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class KualitasPanenController extends GetxController {
  static KualitasPanenController get to => Get.find();

  late FusionCharts pieKualitasPanen;
  late FusionCharts stackKualitasPanenPerSKU;

  // Chart List
  final PieKualitasPanenController pie = Get.find();
  final StackKualitasPanenPerSKUController stack = Get.find();

  @override
  void onInit() {
    super.onInit();

    pieKualitasPanen = pie.fusionChart;
    stackKualitasPanenPerSKU = stack.fusionChart;
  }
}
