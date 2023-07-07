import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agro_integration_dashboard/controller/global_controller.dart';

class Indicator extends StatelessWidget {
  final GlobalController gc = Get.find();

  Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: gc.isOnline.value
            ? Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[300],
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              )
            : Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[300],
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
        onPressed: () {},
      ),
    );
  }
}
