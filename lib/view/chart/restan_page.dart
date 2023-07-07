import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/restan/restan_controller.dart';
import 'package:agro_integration_dashboard/view/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestanPage extends GetView<RestanController> {
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
                      height: 200,
                      child: restanCard(context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: controller.kombinasiChartPencapaianPanenTonase,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    dataRestanTPH(context),
                    SizedBox(
                      height: 10,
                    ),
                    dataRestanTruck(context),
                  ],
                ),
              ),
      ),
    );
  }

  Widget restanCard(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(12),
      child: Card(
        color: Colors.pinkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  "Restan",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "42",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " Janjang",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "|",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "0.64",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " Ton",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dataRestanTPH(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                "Restran TPH",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FittedBox(
            child: DataTable(
              columns: const <DataColumn>[
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
                    'Tanggal Panen',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Janjang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Blok',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'TPH',
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
                      Text('Jajang'),
                    ),
                    DataCell(
                      Text('23-FEB-2023'),
                    ),
                    DataCell(
                      Text('42'),
                    ),
                    DataCell(
                      Text('B2'),
                    ),
                    DataCell(
                      Text('12'),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text('Yudi'),
                    ),
                    DataCell(
                      Text('23-FEB-2023'),
                    ),
                    DataCell(
                      Text('30'),
                    ),
                    DataCell(
                      Text('B2'),
                    ),
                    DataCell(
                      Text('17'),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text('Juddin'),
                    ),
                    DataCell(
                      Text('23-FEB-2023'),
                    ),
                    DataCell(
                      Text('12'),
                    ),
                    DataCell(
                      Text('B2'),
                    ),
                    DataCell(
                      Text('53'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dataRestanTruck(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                "Restran Truk",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FittedBox(
            child: DataTable(
              columns: const <DataColumn>[
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
                    'Tanggal Angkut',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'NPB',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Janjang',
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
                      Text('KT 1298 BR'),
                    ),
                    DataCell(
                      Text('23-FEB-2023'),
                    ),
                    DataCell(
                      Text('F12987'),
                    ),
                    DataCell(
                      Text('F12987'),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text('KT 3287 TT'),
                    ),
                    DataCell(
                      Text('23-FEB-2023'),
                    ),
                    DataCell(
                      Text('F12965'),
                    ),
                    DataCell(
                      Text('412'),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text('KT 5150 TO'),
                    ),
                    DataCell(
                      Text('23-FEB-2023'),
                    ),
                    DataCell(
                      Text('F12977'),
                    ),
                    DataCell(
                      Text('318'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
