import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  Future<Map<String, dynamic>> loadCategory() {
    return BaseNetwork.get("remote-jobs");
  }
}
