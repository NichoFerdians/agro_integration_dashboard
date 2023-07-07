import 'package:agro_integration_dashboard/controller/global_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/group_pencapaian_panen_janjang_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/group_pencapaian_panen_tonase_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/line_pencapaian_panen_janjang_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/line_pencapaian_panen_tonase_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/pencapaian_panen_janjang_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/chart/pencapaian_panen_tonase_controller.dart';
import 'package:agro_integration_dashboard/controller/panen/panen_controller.dart';
import 'package:get/get.dart';

class PanenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<PanenController>(() => PanenController());
    Get.lazyPut<PencapaianPanenJanjangController>(
        () => PencapaianPanenJanjangController());
    Get.lazyPut<PencapaianPanenTonaseController>(
        () => PencapaianPanenTonaseController());
    Get.lazyPut<GroupPencapaianPanenJanjangController>(
        () => GroupPencapaianPanenJanjangController());
    Get.lazyPut<GroupPencapaianPanenTonaseController>(
        () => GroupPencapaianPanenTonaseController());
    Get.lazyPut<LinePencapaianPanenJanjangController>(
        () => LinePencapaianPanenJanjangController());
    Get.lazyPut<LinePencapaianPanenTonaseController>(
        () => LinePencapaianPanenTonaseController());
  }
}
