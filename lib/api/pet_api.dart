import 'package:pet_card/api/dio_basic.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/helpers/http.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/models/pet.dart';

class PetApi extends DioBasic {
  final AuthenticationClient _authenticationClient;

  PetApi(Http http, this._authenticationClient) : super(http);

  Future<HttpResponse<List<Pet>>> myPets(String familyId) async {
    final token = await _authenticationClient.accessToken;
    return http.request<List<Pet>>(
      "/pets/$familyId/family",
      method: "GET",
      headers: {
        "Authorization": "Bearer ${token!}",
      },
      parser: (data) {
        return Pets.fromJson(data).pets;
      },
    );
  }
}
