import 'package:flutter/material.dart';
import 'package:pet_card/utils/responsive.dart';
import 'package:pet_card/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "login";

  const LoginPage({Key? key}) : super (key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: responsive.height,
            child: Stack(
              children: const [
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }

}