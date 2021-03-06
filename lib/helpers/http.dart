import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pet_card/helpers/http_response.dart';

class Http {
  late final Dio _dio;
  late final Logger _logger;
  bool _logsEnabled = false;

  Http ({
    required Dio dio,
    required Logger logger,
    required bool logsEnabled,
  }) {
    _dio = dio;
    _logger = logger;
    _logsEnabled = logsEnabled;
  }

  Future<HttpResponse<T>> request<T>(String path, {
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    T Function(dynamic data)? parser,
}) async {
    try {
      final Response response = await _dio.request(
        path,
        options: Options(
          method: method,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: headers,
        ),
        queryParameters: queryParameters,
        data: data,
      );
      if (parser != null) {
        return HttpResponse.success<T>(parser(response.data));
      }
      return HttpResponse.success<T>(response.data);
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
    }
  }
}