import 'package:agro_integration_dashboard/component/card_view.dart';
import 'package:agro_integration_dashboard/controller/chart_controller.dart';
import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/home_controller.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAsistenViewV1 extends GetView<GlobalController> {
  final HomeController home = Get.find();
  final ChartController chart = Get.find();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var name = box.read('name');
    var role_desc = box.read('role_desc');

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            margin: EdgeInsets.all(12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Center(
                      child: Initicon(text: name, elevation: 4),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name),
                        Text(role_desc),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // height: MediaQuery.of(context).size.height / 3,
            margin: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width,
            child: CardView(
              label: "Performance",
              primary: Colors.redAccent,
              onPrimary: Colors.white,
              isCenter: true,
              onTap: () {
                chart.chartType.value = 'example';
                Get.toNamed('/chart');
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView(
              padding: EdgeInsets.all(15),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 2 / 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                CardView(
                  label: "Restan",
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  onTap: () {
                    chart.chartType.value = 'example';
                    Get.toNamed('/chart');
                  },
                ),
                CardView(
                  label: "Kualitas Panen",
                  primary: Colors.greenAccent,
                  onPrimary: Colors.white,
                  onTap: () {
                    chart.chartType.value = 'example';
                    Get.toNamed('/chart');
                  },
                ),
                CardView(
                  label: "Produktifitas Unit Angkut",
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  onTap: () {
                    chart.chartType.value = 'example';
                    Get.toNamed('/chart');
                  },
                ),
                CardView(
                  label: "Jumlah Unit",
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  onTap: () {
                    chart.chartType.value = 'example';
                    Get.toNamed('/chart');
                  },
                ),
                CardView(
                  label: "Produktifitas SKU",
                  primary: Colors.yellowAccent,
                  onPrimary: Colors.white,
                  onTap: () {
                    chart.chartType.value = 'example';
                    Get.toNamed('/chart');
                  },
                ),
                CardView(
                  label: "Jumlah SKU",
                  primary: Colors.grey,
                  onPrimary: Colors.white,
                  onTap: () {
                    chart.chartType.value = 'example';
                    Get.toNamed('/chart');
                  },
                ),
                CardView(
                  label: "Rotasi Panen",
                  primary: Colors.lightBlue,
                  onPrimary: Colors.white,
                  onTap: () {
                    chart.chartType.value = 'example';
                    Get.toNamed('/chart');
                  },
                ),
              ],
            ),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       cardUI(100, 150, 'RESTAN', Colors.red),
          //       cardUI(100, 150, 'KUALITAS PANEN', Colors.green),
          //       cardUI(100, 150, 'PRODUKTIFITAS UNIT ANGKUT', Colors.red),
          //       cardUI(100, 150, 'JUMLAH UNIT', Colors.red),
          //       cardUI(100, 150, 'PRODUKTIFITAS SKU', Colors.green),
          //       cardUI(100, 150, 'JUMLAH SKU', Colors.yellow),
          //       cardUI(100, 150, 'ROTASI PANEN', Colors.yellow),
          //     ],
          //   ),
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     cardUI(50, null, 'ROTASI PANEN <POOR>', Colors.yellow),
          //     cardChart(300, Colors.red),
          //   ],
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 5,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           cardUI(
          //               50, null, '∑Janjang HI 	: 4.100 Janjang', Colors.green),
          //           cardUI(50, null, '∑Janjang SHI 	: 207.111 Janjang',
          //               Colors.green),
          //           cardChart(300, Colors.red),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //         flex: 5,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             cardUI(50, null, '∑Tonase HI 	: 73,8 Ton', Colors.green),
          //             cardUI(
          //                 50, null, '∑Tonase SHI 	: 3.728 Ton', Colors.green),
          //             cardChart(300, Colors.red),
          //           ],
          //         ))
          //   ],
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     cardUI(50, null, 'Detail FFB Production Daily', Colors.yellow),
          //     Row(
          //       children: [
          //         Expanded(
          //           flex: 5,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               cardChart(300, Colors.red),
          //             ],
          //           ),
          //         ),
          //         Expanded(
          //           flex: 5,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               cardChart(300, Colors.red),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Row(
          //       children: [
          //         Expanded(
          //           flex: 5,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [dataRitase()],
          //           ),
          //         ),
          //         Expanded(
          //           flex: 5,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [dataHk()],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // dataTables()
        ],
      ),
    );
  }

  Widget cardUI(double height, double? width, String text, Color color) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      color: color,
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: new Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
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

  Widget dataRitase() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Produktivitas (ritase)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Unit Angkut',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('3'),
              ),
              DataCell(
                Text('KT XX DS'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('3'),
              ),
              DataCell(
                Text('KT XX DS'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('N/A'),
              ),
              DataCell(
                Text('KT XX DS'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dataHk() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Produktivitas (HK)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'SKU',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('N/A'),
              ),
              DataCell(
                Text('Hilman'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('0.8'),
              ),
              DataCell(
                Text('Hildan'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('1.2'),
              ),
              DataCell(
                Text('Hilary'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dataTables() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Lokasi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Unit Angkut',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Total TBS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Nama SKU',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Tanggal Tiket',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('012/B2/9'),
              ),
              DataCell(
                Text('N/A'),
              ),
              DataCell(
                Text('22'),
              ),
              DataCell(
                Text('Hillary'),
              ),
              DataCell(
                Text('31 Mei 2023'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('012/B2/9'),
              ),
              DataCell(
                Text('N/A'),
              ),
              DataCell(
                Text('22'),
              ),
              DataCell(
                Text('Hillary'),
              ),
              DataCell(
                Text('31 Mei 2023'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('012/B2/9'),
              ),
              DataCell(
                Text('N/A'),
              ),
              DataCell(
                Text('22'),
              ),
              DataCell(
                Text('Hillary'),
              ),
              DataCell(
                Text('31 Mei 2023'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardBuilder(double height, double? width, String text, Color color) {
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
                  child: Expanded(
                    child: Text(
                      text,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis),
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
}
