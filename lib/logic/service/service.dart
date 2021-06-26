import 'package:dio/dio.dart';
import 'package:random_user/helper/dio_settings.dart';
import 'package:random_user/logic/model/user_model.dart';

class ServiceApi {
  late DioSettings _dioSettings;
  late Dio _dio;

  /// И мап для запроса
  late Map<String, dynamic> request;
  static ServiceApi _instance = new ServiceApi.internal();
  factory ServiceApi() => _instance;
  ServiceApi.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }
  Future<User> getUser() async {
    try {
      final response = await _dio.get("/api1/");
      User user = User.fromJson(response.data);

      return user;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
