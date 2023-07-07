import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class PencapaianPanenTonaseController extends GetxController {
  static PencapaianPanenTonaseController get to => Get.find();

  late FusionCharts fusionChart;
  // final fusionChart = Future.value(<FusionCharts>[]).obs;

  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic> chart = {
      "caption": "Pencapaian Panen (Tonase)",
      "xaxisname": "",
      "yaxisname": "BJR BULAN LALU",
      "theme": "fusion",
    };

    List<dynamic> chartData = [
      {"label": "RKH", "value": "23", "color": "#f02d2d"},
      {"label": "Actual Panen", "value": "22", "color": "#2d37f0"},
      {"label": "Diterima PKS", "value": "20", "color": "#c1b9b9"},
      {"label": "Terbentuk NPB", "value": "20", "color": "#ffd60a"},
    ];

    Map<String, dynamic> dataSource = {"chart": chart, "data": chartData};

    fusionChart = FusionCharts(
      type: "bar2d",
      width: "100%",
      height: "100%",
      dataSource: dataSource,
    );
  }

  void callBackFromPlugin(senderId, eventType) {
    if (true) {
      print('Event Back to consumer: $senderId , $eventType');
    }
  }
}
