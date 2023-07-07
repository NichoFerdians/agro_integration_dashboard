import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/produktifitas_sku/produktivitas_sku_controller.dart';
import 'package:agro_integration_dashboard/view/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProduktivitasSKUPage extends GetView<ProduktivitasSKUController> {
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
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: produktivitasPemanenCard(context),
                        ),
                        Expanded(
                          flex: 5,
                          child: jumlahSKUHadirCard(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: controller.barProduktifitasSKU,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      child: dataPanen(context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      child: dataSKU(context),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget dataPanen(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Blok',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'BJR Blok',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Avg Produktivitas SKU',
                  overflow: TextOverflow.ellipsis,
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
                    Text('A3'),
                  ),
                  DataCell(
                    Text('17.3'),
                  ),
                  DataCell(
                    Text('1.30 Ton/HK'),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text('B2'),
                  ),
                  DataCell(
                    Text('18.2'),
                  ),
                  DataCell(
                    Text('1.01 Ton/HK'),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text('D4'),
                  ),
                  DataCell(
                    Text('15.9'),
                  ),
                  DataCell(
                    Text('1.05 Ton/HK'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dataSKU(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Produktivitas HK',
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
                    Text('Hillary'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget produktivitasPemanenCard(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: EdgeInsets.all(2.5),
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
                "Produktivitas Pemanen",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1.12",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Ton / HK",
                    style: TextStyle(
                      fontSize: 10,
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

  Widget jumlahSKUHadirCard(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(2.5),
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Jumlah SKU Hadir",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "31",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " SKU Dari ",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "34",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
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
}
