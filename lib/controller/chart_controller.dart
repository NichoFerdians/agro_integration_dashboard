import 'package:agro_integration_dashboard/controller/chart_example_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

class ChartController extends GetxController {
  static ChartController get to => Get.find();

  late FusionCharts chart;
  var chartType = ''.obs;

  // Chart List
  final ChartExampleController chartExample = Get.find();

  @override
  void onInit() {
    super.onInit();
  }
}
