import 'dart:async';
import 'dart:io';

import 'package:agro_integration_dashboard/provider/data_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// import 'package:survey_app_mobile_service/db/offline_survey_list.dart';

class GlobalController extends GetxController {
  AppDataSource appDataSource = Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  final title = ''.obs;
  var lastUpdate = "-".obs;
  var surveys = [].obs;
  var isOnline = false.obs;
  var isLoading = false.obs;
  var dateController = ''.obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    debugPrint('                       Init Global Controller           ');
    debugPrint('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    getConnectionType();

    if (dateController.value == '') {
      var date = DateTime.now().subtract(Duration(days: 1));
      dateController.value = DateFormat('dd MMMM yyyy').format(date);
    }
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_checkConnection);
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }

  Future<void> getConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      debugPrint("$e");
    }
    return _checkConnection(connectivityResult);
  }

  _checkStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      return true;
    }

    return false;
  }

  void _checkConnection(ConnectivityResult result) async {
    var status = _checkStatus(result);
    isOnline.value = false;
    update();
    if (status) {
      try {
        var result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          isOnline.value = true;
        } else {
          isOnline.value = false;
        }
      } catch (_) {
        isOnline.value = false;
      }
    } else {
      isOnline.value = false;
    }
    update();
    debugPrint("Connection Status: ${isOnline.value}");
    fetchData(isOnline.value);

    if (isOnline.value) {
      // TODO: Sync Data Submit

      // var data = await SavedSurvey.getReadyToSubmitSurveys();
      // for (var row in data) {
      //   var response = await appDataSource.submitSurvey(row['payload']);
      //   if (response) {
      //     SavedSurvey.updateSurvey(row['id']);
      //   }
      // }
      // savedSurveyController.fetchSavedSurveys();
    }
  }

  void fetchData(bool connected) async {
    try {
      isLoading(true);
      if (connected) {
        debugPrint("online");
        // var data = await appDataSource.loadSurveyList();
        // Iterable it = data['data']['surveys'];
        // List<SurveyList> surveyList =
        //     it.map((e) => SurveyList.fromJson(e)).toList();

        // surveys.value = surveyList;
        // await OfflineSurveyList.createOfflineSurveyList(
        //     json.encode(data['data']['surveys']));
      } else {
        debugPrint("offline");
        // var data = await OfflineSurveyList.getOfflineSurveyLists();
        // Iterable it = json.decode(data[0]['payload']);
        // List<SurveyList> surveyList =
        //     it.map((e) => SurveyList.fromJson(e)).toList();

        // surveys.value = surveyList;
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      debugPrint("GlobalController - onCatch error $e");
    }
  }
}
