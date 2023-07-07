import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class KombinasiPencapaianPanenTonaseController extends GetxController {
  static KombinasiPencapaianPanenTonaseController get to => Get.find();

  late FusionCharts fusionChart;
  // final fusionChart = Future.value(<FusionCharts>[]).obs;

  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic> chart = {
      "caption": "Pencapaian Panen (Tonase)",
      "xaxisname": "",
      "yaxisname": "",
      "theme": "fusion",
      "drawcrossline": "1",
    };

    List<dynamic> categories = [
      {
        "category": [
          {"label": "A3"},
          {"label": "B2"},
          {"label": "D4"},
        ]
      }
    ];

    List<dynamic> chartData = [
      {
        "seriesname": "Total Jig Panen",
        "color": "#f02d2d",
        "data": [
          {"value": "238"},
          {"value": "198"},
          {"value": "60"},
          // {"value": "238"},
          // {"value": "238"},
          // {"value": "0"},
        ]
      },
      {"seriesname": "", "alpha": "0", "data": []},
      {
        "seriesname": "Total Jig Kirim",
        "color": "#2d37f0",
        "data": [
          {"value": "238"},
          {"value": "156"},
          {"value": "60"},
          // {"value": "198"},
          // {"value": "156"},
          // {"value": "42"},
        ]
      },
      {"seriesname": "", "alpha": "0", "data": []},
      {
        "seriesname": "Total Jig Restan",
        "color": "#c1b9b9",
        "data": [
          {"value": "0"},
          {"value": "42"},
          {"value": "0"},
          // {"value": "60"},
          // {"value": "60"},
          // {"value": "0"},
        ]
      },
      {"seriesname": "", "alpha": "0", "data": []},
      {
        "seriesname": "Total Tiket Restan",
        "color": "#ffd60a",
        "renderas": "line",
        "parentyaxis": "S",
        "data": [
          {"value": "0"},
          {"value": "1"},
          {"value": "0"},
        ]
      }
    ];

    Map<String, dynamic> dataSource = {
      "chart": chart,
      "categories": categories,
      "dataset": chartData
    };

    fusionChart = FusionCharts(
      type: "stackedcolumn2dlinedy",
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
