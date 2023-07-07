import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class GroupPencapaianPanenJanjangController extends GetxController {
  static GroupPencapaianPanenJanjangController get to => Get.find();

  late FusionCharts fusionChart;
  // final fusionChart = Future.value(<FusionCharts>[]).obs;

  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic> chart = {
      "caption": "Pencapaian Panen Per Blok (Janjang)",
      "xaxisname": "",
      "yaxisname": "",
      "theme": "fusion",
      "drawcrossline": "1"
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
        "seriesname": "RKH",
        "color": "#f02d2d",
        "data": [
          {"value": "125000"},
          {"value": "300000"},
          {"value": "480000"},
        ]
      },
      {"seriesname": "", "alpha": "0", "data": []},
      {
        "seriesname": "Actual Panen",
        "color": "#2d37f0",
        "data": [
          {"value": "70000"},
          {"value": "150000"},
          {"value": "350000"},
        ]
      },
      {"seriesname": "", "alpha": "0", "data": []},
      {
        "seriesname": "Diterima PKS",
        "color": "#c1b9b9",
        "data": [
          {"value": "10000"},
          {"value": "100000"},
          {"value": "300000"},
        ]
      },
      {"seriesname": "", "alpha": "0", "data": []},
      {
        "seriesname": "Terbentuk NPB",
        "color": "#ffd60a",
        "data": [
          {"value": "10000"},
          {"value": "100000"},
          {"value": "300000"},
        ]
      }
    ];

    Map<String, dynamic> dataSource = {
      "chart": chart,
      "categories": categories,
      "dataset": chartData
    };

    fusionChart = FusionCharts(
      type: "mscolumn2d",
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
