import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/pages/home_page.dart';
import 'package:pet_card/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "splashPage";

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _checkLogin();
    });
  }

  Future<void> _checkLogin() async {
    final token = await _authenticationClient.accessToken;
    if (token == null) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
      return;
    }
    final user = await _authenticationClient.user;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        settings: const RouteSettings(name: HomePage.routeName),
        builder: (context) => HomePage(
          user: user,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
