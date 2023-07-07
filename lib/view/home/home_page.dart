import 'package:agro_integration_dashboard/controller/chart_controller.dart';
import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/home_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:agro_integration_dashboard/view/home/home_asisten_view.dart';
import 'package:agro_integration_dashboard/view/home/home_askep_eh_view.dart';
import 'package:agro_integration_dashboard/view/home/home_mandor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/view/indicator.dart';

class HomePage extends GetView<GlobalController> {
  final HomeController home = Get.find();
  final ChartController chart = Get.find();

  final box = GetStorage();

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
        leading: Indicator(),
        actions: [
          IconButton(
            icon: Icon(EvaIcons.logOutOutline),
            visualDensity: VisualDensity.compact,
            onPressed: () {
              logout();
            },
          ),
        ],
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : renderHome()),
    );
  }

  logout() {
    box.erase();
    Get.offAllNamed('/login');
  }

  Widget renderHome() {
    var role = box.read('role');

    switch (role) {
      case 17: // Mandor Panen
        box.write('role_desc', 'Mandor Panen');
        return HomeMandorView();
      case 30: // Asisten Afdeling
        box.write('role_desc', 'Asisten Afdeling');
        return HomeAsistenView();
      case 142: // Asisten Kepala Estate
        box.write('role_desc', 'Asisten Kepala Estate');
        return HomeAskepEhView();
      case 5: // Estate Head
        box.write('role_desc', 'Estate Head');
        return HomeAskepEhView();
      default:
        return Text('role ${role} unknown');
    }
  }
}
