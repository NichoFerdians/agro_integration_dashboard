import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class PencapaianPanenJanjangController extends GetxController {
  static PencapaianPanenJanjangController get to => Get.find();

  late FusionCharts fusionChart;
  // final fusionChart = Future.value(<FusionCharts>[]).obs;

  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic> chart = {
      "caption": "Pencapaian Panen (Janjang)",
      "xaxisname": "",
      "yaxisname": "",
      "theme": "fusion",
    };

    List<dynamic> chartData = [
      {"label": "RKH", "value": "1450", "color": "#f02d2d"},
      {"label": "Actual Panen", "value": "1320", "color": "#2d37f0"},
      {"label": "Diterima PKS", "value": "1100", "color": "#c1b9b9"},
      {"label": "Terbentuk NPB", "value": "1100", "color": "#ffd60a"},
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
