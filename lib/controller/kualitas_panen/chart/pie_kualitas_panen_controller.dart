import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class PieKualitasPanenController extends GetxController {
  static PieKualitasPanenController get to => Get.find();

  late FusionCharts fusionChart;
  // final fusionChart = Future.value(<FusionCharts>[]).obs;

  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic> chart = {
      "caption": "",
      "xaxisname": "",
      "yaxisname": "",
      "theme": "fusion",
      "showpercentvalues": "1",
      "showlegend": "0",
      "labelDisplay": "rotate",
      "slantLabel": "1",
      "pieRadius": "70",
      "enableSmartLabels": "1",
      "skipOverlapLabels": "1",
    };

    List<dynamic> chartData = [
      {"label": "Matang", "value": "90", "color": "#0f9d58"},
      {"label": "Mentah", "value": "4", "color": "#0077B5"},
      {"label": "Busuk", "value": "6", "color": "#e50914"},
    ];

    Map<String, dynamic> dataSource = {"chart": chart, "data": chartData};

    fusionChart = FusionCharts(
      type: "pie2d",
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
