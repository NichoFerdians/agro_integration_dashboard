import 'package:agro_integration_dashboard/controller/restan/chart/kombinasi_pencapaian_panen_tonase_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class RestanController extends GetxController {
  static RestanController get to => Get.find();

  late FusionCharts kombinasiChartPencapaianPanenTonase;

  // Chart List
  final KombinasiPencapaianPanenTonaseController kombinasi = Get.find();

  @override
  void onInit() {
    super.onInit();

    kombinasiChartPencapaianPanenTonase = kombinasi.fusionChart;
  }
}
