import 'package:agro_integration_dashboard/controller/panen/chart/group_pencapaian_panen_janjang_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/group_pencapaian_panen_tonase_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/line_pencapaian_panen_janjang_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/line_pencapaian_panen_tonase_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/pencapaian_panen_janjang_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/pencapaian_panen_tonase_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class PanenController extends GetxController {
  static PanenController get to => Get.find();

  late FusionCharts chartPencapaianPanenJenjang;
  late FusionCharts groupChartPencapaianPanenJenjang;
  late FusionCharts lineChartPencapaianPanenJenjang;
  late FusionCharts chartPencapaianPanenTonase;
  late FusionCharts groupChartPencapaianPanenTonase;
  late FusionCharts lineChartPencapaianPanenTonase;

  // Chart List
  final PencapaianPanenJanjangController jenjang = Get.find();
  final GroupPencapaianPanenJanjangController groupJenjang = Get.find();
  final LinePencapaianPanenJanjangController lineJenjang = Get.find();
  final PencapaianPanenTonaseController tonase = Get.find();
  final GroupPencapaianPanenTonaseController groupTonase = Get.find();
  final LinePencapaianPanenTonaseController lineTonase = Get.find();

  @override
  void onInit() {
    super.onInit();

    chartPencapaianPanenJenjang = jenjang.fusionChart;
    chartPencapaianPanenTonase = tonase.fusionChart;
    groupChartPencapaianPanenJenjang = groupJenjang.fusionChart;
    groupChartPencapaianPanenTonase = groupTonase.fusionChart;
    lineChartPencapaianPanenJenjang = lineJenjang.fusionChart;
    lineChartPencapaianPanenTonase = lineTonase.fusionChart;
  }
}
