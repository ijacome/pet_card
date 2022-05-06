import 'package:pet_card/api/family_api.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/models/customers/family.dart';
import 'package:pet_card/repositories/basic_repository.dart';

class FamilyRepository extends BasicRepository {
  late final FamilyApi _familyApi = FamilyApi(http, authenticationClient);

  Future<HttpResponse<List<Family>>> myFamilies() async {
    return await _familyApi.myFamilies();
  }
}