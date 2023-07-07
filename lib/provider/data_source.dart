import 'package:http/http.dart' as http;
import 'base_network.dart';

class AppDataSource {
  static AppDataSource instance = AppDataSource();
  static var client = http.Client();

  Future<bool> login(payload) async {
    var result = await BaseNetwork.login(payload);

    if (result == "error") {
      return false;
    }

    return true;
  }
}
