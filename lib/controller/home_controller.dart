import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  @override
  void onInit() {
    debugPrint('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    debugPrint('                       Init Home Controller             ');
    debugPrint('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    super.onInit();
  }
}
