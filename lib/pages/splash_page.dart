import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super (key: key);

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

  Future<void> _checkLogin () async {
    final token = await _authenticationClient.accessToken;
    if (token == null) {
      Navigator.pushReplacementNamed(context, 'MyHomePage');
      return;
    }
    Navigator.pushReplacementNamed(context, 'MyHomePage');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}