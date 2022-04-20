import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/pages/login_page.dart';
import 'package:pet_card/utils/responsive.dart';
import 'package:pet_card/widgets/login_form.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home";

  const HomePage({Key? key}) : super (key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final AuthenticationClient _authenticationClient = GetIt.instance<AuthenticationClient>();
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: TextButton(
            onPressed: () async {
              await _authenticationClient.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginPage.routeName, (route) => false,
              );
            },
              child: Text("Logout"),
          ),
        ),
      ),
    );
  }

}