import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/kualitas_panen/kualitas_panen_controller.dart';
import 'package:agro_integration_dashboard/view/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KualitasPanenPage extends GetView<KualitasPanenController> {
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
                      // width: MediaQuery.of(context).size.width / 2,
                      height: 300,
                      child: controller.pieKualitasPanen,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 300,
                      child: dataTable(context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width / 2,
                      height: 300,
                      child: controller.stackKualitasPanenPerSKU,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget dataTable(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Kualitas Buah',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Total Janjang',
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
                    Text('Buah Matang'),
                  ),
                  DataCell(
                    Text('400'),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text('Buah Busuk'),
                  ),
                  DataCell(
                    Text('27'),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text('Buah Mentah'),
                  ),
                  DataCell(
                    Text('18'),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text('Tangkai Panjang'),
                  ),
                  DataCell(
                    Text('0'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
