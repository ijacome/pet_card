import 'package:pet_card/api/dio_basic.dart';
import 'package:pet_card/helpers/http.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/models/authentication_response.dart';
import 'package:pet_card/models/user.dart';

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
          "email": email,
          "password": password
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
        "email": email,
        "password": password
      },
      parser: (data) {
        return AuthenticationResponse.fromJson(data);
      },
    );
  }

  Future<HttpResponse<AuthenticationResponse>> refreshToken(String expiredToken, User user) {
    return http.request<AuthenticationResponse>(
        "/api/refresh",
        method: "POST",
        headers: {
          "Authorization": "Bearer $expiredToken",
        },
        parser: (data) {
          data['user'] = user.toJson();
          return AuthenticationResponse.fromJson(data);
        }
    );
  }
}