import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;
import 'package:pet_card/api/dio_basic.dart';
import 'package:pet_card/helpers/http.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/models/Authentication_response.dart';

class Authentication extends DioBasic {

  Authentication(Http http) : super(http);


  Future<HttpResponse<AuthenticationResponse>> register({
    required String email,
    required String password,
  }) {
    return http.request<AuthenticationResponse>(
        "/api/register",
        method: "POST",
        data: {
          email: email,
          password: password
        },
        parser: (data) {
          return AuthenticationResponse.fromJson(data);
        }
    );
  }

  Future<HttpResponse<AuthenticationResponse>> login({
    required String email,
    required String password,
  }) {
    return http.request<AuthenticationResponse>(
      "/api/login",
      method: "POST",
      data: {
        email: email,
        password: password
      },
      parser: (data) {
        return AuthenticationResponse.fromJson(data);
      }
    );
  }
}