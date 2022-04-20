import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pet_card/api/authentication.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/data/environment.dart';
import 'package:pet_card/helpers/http.dart';

abstract class DependencyInjection {

  static void initialize() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: Environment.apiUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ));
    Logger logger = Logger();
    Http http = Http(
      dio: dio,
      logger: logger,
      logsEnabled: false,
    );

    const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

    final authentication = Authentication(http);
    final authenticationClient = AuthenticationClient(_secureStorage);


    GetIt.instance.registerSingleton<Authentication>(authentication);
    GetIt.instance.registerSingleton<AuthenticationClient>(authenticationClient);
  }
}