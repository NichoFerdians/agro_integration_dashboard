import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class BarProduktivitasSKUController extends GetxController {
  static BarProduktivitasSKUController get to => Get.find();

  late FusionCharts fusionChart;
  // final fusionChart = Future.value(<FusionCharts>[]).obs;

  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic> chart = {
      "caption": "Top 10 Produktivitas SKU",
      "xaxisname": "",
      "yaxisname": "",
      "theme": "fusion",
    };

    List<dynamic> chartData = [
      {"label": "SKU J", "value": "1.41"},
      {"label": "SKU I", "value": "1.41"},
      {"label": "SKU H", "value": "1.4"},
      {"label": "SKU G", "value": "1.39"},
      {"label": "SKU F", "value": "1.35"},
      {"label": "SKU E", "value": "1.35"},
      {"label": "SKU D", "value": "1.34"},
      {"label": "SKU C", "value": "1.21"},
      {"label": "SKU B", "value": "1.03"},
      {"label": "SKU A", "value": "1.01"},
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
