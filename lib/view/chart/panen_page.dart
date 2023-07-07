import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/panen_controller.dart';
import 'package:agro_integration_dashboard/view/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PanenPage extends GetView<PanenController> {
  final GlobalController global = Get.find();

  @override
  Widget build(BuildContext context) {
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
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: controller.chartPencapaianPanenJenjang,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: controller.chartPencapaianPanenTonase,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: controller.groupChartPencapaianPanenJenjang,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: controller.groupChartPencapaianPanenTonase,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: controller.lineChartPencapaianPanenJenjang,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: controller.lineChartPencapaianPanenTonase,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
