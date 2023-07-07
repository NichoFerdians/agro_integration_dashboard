import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static const String baseUrl = "http://192.168.202.119:88";
  // static const String baseUrl = "http://10.0.2.2:8000";

  // static const String urlLogin =
  //     "http://192.168.202.119/api_dsn/api/ldap_login?username=dami&password=swakarsa";
  static const String pathLogin = "/api/mobile/elhm/login";
  static const String token =
      "c3VydmV5X2FwcF9zcnY6NTFhYzVjNGY1ZmRmMWYxNmMyMzYwNDY1MTJmNGVkYjI=";

  static Future<String> get(String partUrl) async {
    final fullUrl = baseUrl + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");

    final response = await http.get(
      Uri.parse(fullUrl),
      headers: {
        HttpHeaders.authorizationHeader: "Basic $token",
      },
    );

    debugPrint("BaseNetwork - response : ${response.body}");

    return _processResponse(response);
  }

  static Future<String> login(String body) async {
    const fullUrl = baseUrl + pathLogin;

    debugPrint("BaseNetwork - fullUrl : $fullUrl body $body");

    final response = await http.post(
      Uri.parse(fullUrl),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: body,
    );

    debugPrint("Login - response : ${response.body}");

    Map<String, dynamic> res = jsonDecode(response.body);

    final box = GetStorage();

    if (response.statusCode == 200 || response.statusCode == 201) {
      box.write('user_name', res['user']['user_name']);
      box.write('role', res['employee']['position_id']);
      box.write('name', res['employee']['name']);
    }

    return _processResponse(response);
  }

  static Future<String> _processResponse(http.Response response) async {
    debugPrint("status code = ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Get.snackbar('', 'Success', duration: const Duration(seconds: 2));
      return response.body;
    } else {
      print("processResponse error");
      // if (response.statusCode == 409) {
      //   Get.snackbar('', 'Survey sudah pernah dikirim sebelumnya',
      //       duration: const Duration(seconds: 4));
      // } else {
      //   Get.snackbar('', 'Failed: ', duration: const Duration(seconds: 4));
      // }
      return "error";
    }
  }
}
