import 'package:pet_card/api/pet_api.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/models/pet.dart';
import 'package:pet_card/repositories/basic_repository.dart';

class PetRepository extends BasicRepository {
  late final PetApi _petApi = PetApi(http, authenticationClient);

  Future<HttpResponse<List<Pet>>> myPets(String familyId) async {
    return await _petApi.myPets(familyId);
  }
}