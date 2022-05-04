import 'package:pet_card/api/dio_basic.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/helpers/http.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/models/customers/family.dart';

class FamilyApi extends DioBasic {
  final AuthenticationClient _authenticationClient;
  FamilyApi(Http http, this._authenticationClient) : super(http);

  Future<HttpResponse<List<Family>>> myFamilies() async {
    final token = await _authenticationClient.accessToken;
    return http.request<List<Family>>(
      "/my-families",
      method: "GET",
      headers: {
        "Authorization": "Bearer ${token!}",
      },
      parser: (data) {
        return Families.fromJson(data).families;
      }
    );
  }
}