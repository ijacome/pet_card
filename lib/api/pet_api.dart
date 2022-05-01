import 'package:dio/dio.dart';
import 'package:pet_card/api/dio_basic.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/helpers/http.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/models/pet.dart';

class DioPet extends DioBasic {
  final AuthenticationClient _authenticationClient;
  DioPet(Http http, this._authenticationClient) : super(http);

  Future<HttpResponse<Pet>> myFamilies() async {
    final token = await _authenticationClient.accessToken;
    return http.request(
      "/my-families",
      method: "GET",
      headers: {
        "token": token!,
      },
      parser: (data) {
        return Pet.fromJson(data);
      }
    );
  }
}