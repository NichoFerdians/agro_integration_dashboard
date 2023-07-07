import 'package:agro_integration_dashboard/controller/chart_controller.dart';
import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAskepEhView extends GetView<GlobalController> {
  final HomeController home = Get.find();
  final ChartController chart = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Asisten Afd: '),
                        Expanded(child: Text('Usman')),
                      ]),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lokasi Panen: '),
                        Expanded(child: Text('Blok A3 ; Blok B2 ; Blok D4')),
                      ]),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cardUI(100, null, 'PANEN', Colors.red),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _cardBuilder(100, 150, 'RESTAN', Colors.red),
                _cardBuilder(100, 150, 'KUALITAS PANEN', Colors.green),
                _cardBuilder(100, 150, 'PRODUKTIFITAS UNIT ANGKUT', Colors.red),
                _cardBuilder(100, 150, 'JUMLAH UNIT', Colors.red),
                _cardBuilder(100, 150, 'PRODUKTIFITAS SKU', Colors.green),
                _cardBuilder(100, 150, 'JUMLAH SKU', Colors.yellow),
                _cardBuilder(100, 150, 'ROTASI PANEN', Colors.yellow),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cardUI(50, null, 'ROTASI PANEN <POOR>', Colors.yellow),
              // cardChart(300, Colors.red),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    cardUI(
                        50, null, '∑Janjang HI 	: 4.100 Janjang', Colors.green),
                    cardUI(50, null, '∑Janjang SHI 	: 207.111 Janjang',
                        Colors.green),
                    // cardChart(300, Colors.red),
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cardUI(50, null, '∑Tonase HI 	: 73,8 Ton', Colors.green),
                      cardUI(
                          50, null, '∑Tonase SHI 	: 3.728 Ton', Colors.green),
                      // cardChart(300, Colors.red),
                    ],
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cardUI(50, null, 'Detail FFB Production Daily', Colors.yellow),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // cardChart(300, Colors.red),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // cardChart(300, Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  cardUI(
                      50, 300, 'Restan	: 138 Janjang / 2,67 ton', Colors.red),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardUI(
      double height, double? width, String text, MaterialColor color) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: color,
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Flexible(child: new Text(text)),
          ),
        ));
  }

  Widget _cardBuilder(
      double height, double? width, String text, MaterialColor color) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon(
            //   icon,
            //   color: Colors.blue,
            //   size: 35,
            // ),
            // const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                // FittedBox(
                //   child: Text(
                //     body,
                //     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget cardChart(double height, Color color) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     elevation: 0,
  //     color: color,
  //     child: SizedBox(
  //       height: height,
  //       child: chart.fusionChart2D,
  //     ),
  //   );
  // }
}
