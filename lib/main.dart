import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pet_card/data/environment.dart';
import 'package:pet_card/helpers/dependency_injection.dart';
import 'package:pet_card/l10n/L10n.dart';
import 'package:pet_card/pages/home_page.dart';
import 'package:pet_card/pages/login_page.dart';
import 'package:pet_card/pages/splash_page.dart';

Future<void> main() async {
  await dotenv.load(
    fileName: Environment.fileName,
  );
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Pet Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashPage(),
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        LoginPage.routeName: (_) => const LoginPage(),
        SplashPage.routeName: (_) => const SplashPage()
      },
    );
  }
}
