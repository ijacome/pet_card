import 'package:pet_card/api/pet_api.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/repositories/basic_repository.dart';

class PetRepository extends BasicRepository {
  late final DioPet _dioPet = DioPet(http, authenticationClient);

  Future<HttpResponse> myFamilies() async {
    return _dioPet.myFamilies();
  }
}