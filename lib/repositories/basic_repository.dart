import 'package:get_it/get_it.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/helpers/http.dart';

abstract class BasicRepository {
  final Http http = GetIt.instance<Http>();
  final AuthenticationClient authenticationClient =
  GetIt.instance<AuthenticationClient>();
}