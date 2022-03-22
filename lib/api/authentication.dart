import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;

class Authentication {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await _dio.post(
          "${dotenv.env['API_URL']}/api/register",
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
      _logger.i(response.data);
    } catch (e) {
      _logger.e(e);
    }

  }
}