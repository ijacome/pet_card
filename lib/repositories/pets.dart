import 'package:pet_card/api/pets.dart';
import 'package:pet_card/helpers/http_response.dart';

class Pets {
  final DioPet _dioPet = DioPet();

  Future<HttpResponse> myFamilies() async {
    return _dioPet.myFamilies();
  }
}