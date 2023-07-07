import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:agro_integration_dashboard/provider/data_source.dart';

class LoginController extends GetxController {
  AppDataSource appDataSource = Get.find();

  final box = GetStorage();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    debugPrint('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    debugPrint('                       Init Login Controller            ');
    debugPrint('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    print(box.read('user_name'));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void onReady() {
    var isLogin = box.hasData('user_name');

    if (isLogin) {
      Get.offAndToNamed("/home");
    }
    super.onReady();
  }

  dynamic validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  Future<String?> authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return checkUser(data.name, data.password).then((auth) {
      if (!auth) {
        return 'Invalid email or password';
      }
      // Get.toNamed('home');

      return null;
    });
  }

  void login() {
    var state = formKey.currentState;
    var form = state?.validate() ?? false;

    if (form) {
      checkUser(emailController.text, passwordController.text).then((auth) {
        if (auth) {
          Get.snackbar('Login', 'Login successfully');
          box.write('user_name', emailController.text);
          btnController.success();
          Timer(const Duration(seconds: 2), () {
            Get.offAndToNamed("/home");
          });
        } else {
          Get.snackbar('Login', 'Invalid email or password');
          btnController.error();
          Timer(const Duration(seconds: 2), () {
            btnController.reset();
          });
          passwordController.clear();
        }
      });
    }
  }

  Future<bool> checkUser(String user, String password) async {
    var data = {'user_name': user, 'password': password};

    var jsonData = json.encode(data);
    var response = await appDataSource.login(jsonData);
    if (response) {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
