import 'package:agro_integration_dashboard/controller/chart_controller.dart';
import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/view/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartPage extends GetView<ChartController> {
  final GlobalController global = Get.find();

  @override
  Widget build(BuildContext context) {
    // debugPrint("[][][][][][][][][][][][][][][][][][][][][][][]");
    // debugPrint(controller.chartType.value);

    switch (controller.chartType.value) {
      case 'example':
        controller.chart = controller.chartExample.fusionChart;
        break;
      default:
        Get.snackbar('Error', 'Unknown chart type');
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset(
          'assets/logo.png',
          height: 35,
        )),
        // title: Image.asset('assets/logo.png'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.blue, Colors.lightBlue],
            ),
          ),
        ),
        actions: [
          Indicator(),
        ],
      ),
      body: Obx(
        () => global.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: controller.chart),
      ),
    );
  }
}
