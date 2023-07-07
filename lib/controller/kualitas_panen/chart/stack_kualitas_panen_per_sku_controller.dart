import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class StackKualitasPanenPerSKUController extends GetxController {
  static StackKualitasPanenPerSKUController get to => Get.find();

  late FusionCharts fusionChart;
  // final fusionChart = Future.value(<FusionCharts>[]).obs;

  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic> chart = {
      "caption": "Kualitas Panen Per SKU",
      "xaxisname": "",
      "yaxisname": "",
      "theme": "fusion",
      "drawcrossline": "1"
    };

    List<dynamic> categories = [
      {
        "category": [
          {"label": "SKU D"},
          {"label": "SKU C"},
          {"label": "SKU B"},
          {"label": "SKU A"},
        ]
      }
    ];

    List<dynamic> chartData = [
      {
        "seriesname": "Matang",
        "color": "#0f9d58",
        "data": [
          {"value": "115"},
          {"value": "112"},
          {"value": "98"},
          {"value": "100"},
        ]
      },
      {
        "seriesname": "Busuk",
        "color": "#e50914",
        "data": [
          {"value": "4"},
          {"value": "3"},
          {"value": "5"},
          {"value": "2"},
        ]
      },
      {
        "seriesname": "Mentah",
        "color": "#0077B5",
        "data": [
          {"value": "1"},
          {"value": "0"},
          {"value": "3"},
          {"value": "3"},
        ]
      },
    ];

    Map<String, dynamic> dataSource = {
      "chart": chart,
      "categories": categories,
      "dataset": chartData
    };

    fusionChart = FusionCharts(
      type: "stackedbar2d",
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
