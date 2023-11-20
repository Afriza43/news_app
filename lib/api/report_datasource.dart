import 'package:news_app/api/baseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadReport() {
    return BaseNetwork.get("/reports");
  }

  Future<Map<String, dynamic>> loadDetailReport(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("/reports/$id");
  }
}
