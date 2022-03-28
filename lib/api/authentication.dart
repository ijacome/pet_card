import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;
import 'package:pet_card/data/environment.dart';
import 'package:pet_card/helpers/http_response.dart';

class Authentication {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<HttpResponse> register({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await _dio.post(
          "${Environment.apiUrl}/api/register",
          options: Options(
            headers: {
              'Content-type': 'application/json',
            },
          ),
          data: {
            email: email,
            password: password
          }
      );
      return HttpResponse.success(response.data);
    } catch (e) {
      int statusCode = -1;
      String message = "unknown error";
      dynamic data;

      if (e is DioError) {
        message = e.message;
        if (e.response != null) {
          statusCode = e.response!.statusCode!;
          message = e.response!.statusMessage!;
          data = e.response!.data;
        }
      }

      return HttpResponse.fail(
        statusCode: statusCode,
        message: message,
        data: data,
      );

      _logger.e(e);
    }

  }
}