import 'package:dio/dio.dart';

class CatchException {
  String? message;

  CatchException({this.message});

  static CatchException catchError(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.connectTimeout) {
        return CatchException(message: "Время ожидания истекло");
      } else if (error.type == DioErrorType.response) {
        if (error.response!.statusCode == 404) {
          return CatchException(message: "Не найден такой адрес");
        } else if (error.response!.statusCode == 400) {
          return CatchException(message: "Проверьте классы на подлинность");
        }
        return CatchException(message: "Ошибка в системе");
      }
    } else {
      return CatchException(message: "Произошла системная ошибка");
    }
    return CatchException(message: "Произошла ошибка сервера");
  }
}
