import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/produktivitas_unit/produktivitas_unit_controller.dart';
import 'package:agro_integration_dashboard/view/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProduktivitasUnitPage extends GetView<ProduktivitasUnitController> {
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
                    Container(
                      height: 250,
                      child: plantActCard(context),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 300,
                      child: dataRitase(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget plantActCard(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(12),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Plan vs Act",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Text(
                  "67,6 %",
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Rata-rata ritase"),
                      SizedBox(
                        width: 50,
                      ),
                      Text(": 2 ritase"),
                    ],
                  ),
                  Text("Jumlah UA tidak hadir	  : 1 unit dari 3"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                Text('KT 1299 DS'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('3'),
              ),
              DataCell(
                Text('KT 1289 DS'),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('N/A'),
              ),
              DataCell(
                Text('KT 1279 DS'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
