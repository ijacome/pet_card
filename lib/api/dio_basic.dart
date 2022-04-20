import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pet_card/data/environment.dart';
import 'package:pet_card/helpers/http.dart';

class DioBasic {
  late final Http http;
  final Logger logger = Logger();
  final Dio dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      )
  );
  final Options options = Options(
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );

  DioBasic(this.http);
}