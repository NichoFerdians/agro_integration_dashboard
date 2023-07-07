import 'package:agro_integration_dashboard/controller/chart_controller.dart';
import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMandorView extends GetView<GlobalController> {
  final HomeController home = Get.find();
  final ChartController chart = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Mandor : Abu Bakar'),
              SizedBox(width: 30),
              Text('Lokasi Panen: Blok A3 ; Blok B2 ; Blok D4'),
            ],
          ),
          Row(
            children: [
              Text('Rencana Panen : 23 Ton / 1500 Janjang'),
              SizedBox(width: 30),
              Text('Aktual Panen : 22 Ton / 1340 Janjang'),
            ],
          ),
          // cardChart(300, 'PANEN', Colors.red),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    cardUI(400, 'PANEN', Colors.red),
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cardUI(50, 'RESTAN', Colors.red),
                      cardUI(50, 'KUALITAS PANEN', Colors.green),
                      cardUI(50, 'PRODUKTIFITAS UNIT ANGKUT', Colors.red),
                      cardUI(50, 'JUMLAH UNIT', Colors.red),
                      cardUI(50, 'PRODUKTIFITAS SKU', Colors.green),
                      cardUI(50, 'JUMLAH SKU', Colors.yellow),
                      cardUI(50, 'ROTASI PANEN', Colors.yellow),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget cardUI(double height, String text, MaterialColor color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      color: color,
      child: SizedBox(
        height: height,
        child: Center(child: Text(text)),
      ),
    );
  }

  Widget cardChart(double height, String text, MaterialColor color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      color: color,
      child: SizedBox(
        height: height,
        // child: chart.fusionChart2D,
      ),
    );
  }
}
