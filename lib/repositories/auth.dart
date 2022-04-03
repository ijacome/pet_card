import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_card/api/authentication.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:meta/meta.dart' show required;

class Auth {
  final Authentication _authentication = GetIt.instance<Authentication>();

  Future<HttpResponse> register({
    required String email,
    required String password,
  }) async {
    return _authentication.register(email: email, password: password);
  }

  Future<HttpResponse> login({
    required String email,
    required String password,
  }) async {
    return _authentication.login(email: email, password: password);
  }
}