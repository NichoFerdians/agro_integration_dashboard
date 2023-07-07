import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class ChartExampleController extends GetxController {
  static ChartExampleController get to => Get.find();

  late FusionCharts fusionChart;
  // final fusionChart = Future.value(<FusionCharts>[]).obs;

  FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic> chart = {
      "caption": "Countries With Most Oil Reserves [2017-18]",
      "subcaption": "In MMbbl = One Million barrels",
      "xaxisname": "Country",
      "yaxisname": "Reserves (MMbbl)",
      "numbersuffix": "K",
      "theme": "fusion",
    };

    List<dynamic> chartData = [
      {"label": "Venezuela", "value": "290"},
      {"label": "Saudi", "value": "260"},
      {"label": "Canada", "value": "180"},
      {"label": "Iran", "value": "140"},
      {"label": "Russia", "value": "115"},
      {"label": "UAE", "value": "100"},
      {"label": "US", "value": "30"},
      {"label": "China", "value": "30"}
    ];

    Map<String, dynamic> dataSource = {"chart": chart, "data": chartData};

    fusionChart = FusionCharts(
      type: "column2d",
      width: "100%",
      height: "350",
      dataSource: dataSource,
    );
  }

  void callBackFromPlugin(senderId, eventType) {
    if (true) {
      print('Event Back to consumer: $senderId , $eventType');
    }
  }
}
