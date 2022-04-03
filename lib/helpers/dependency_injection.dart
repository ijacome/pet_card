import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pet_card/api/authentication.dart';
import 'package:pet_card/data/environment.dart';
import 'package:pet_card/helpers/http.dart';

abstract class DependencyInjection {

  static void initialize() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: Environment.apiUrl,
    ));
    Logger logger = Logger();
    Http http = Http(
      dio: dio,
      logger: logger,
      logsEnabled: false,
    );
    final Authentication authentication = Authentication(http);
    
    GetIt.instance.registerSingleton<Authentication>(authentication);
  }
}