import 'package:dio/dio.dart';
import 'package:pet_card/api/dio_basic.dart';
import 'package:pet_card/helpers/http.dart';
import 'package:pet_card/helpers/http_response.dart';

class DioPet extends DioBasic {
  DioPet(Http http) : super(http);

  Future<HttpResponse> myFamilies() async {
    try {
      final Response response = await dio.get(
          "/my-families",
          options: options,
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
    }
  }
}