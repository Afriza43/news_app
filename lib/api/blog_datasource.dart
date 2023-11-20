import 'package:news_app/api/baseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetwork.get("/blogs");
  }

  Future<Map<String, dynamic>> loadDetailloadBlogs(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("/blogs/$id");
  }
}
