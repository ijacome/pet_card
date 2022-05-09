import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/pages/splash_page.dart';
import 'package:pet_card/repositories/auth.dart';
import 'package:pet_card/utils/dialogs.dart';
import 'package:pet_card/utils/my_colors.dart';
import 'package:pet_card/utils/responsive.dart';
import 'package:pet_card/utils/social_media_icons.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Logger _logger = Logger();
  final Auth _authentication = Auth();
  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  String _email = '', _password = '';

  _submit() async {
    if (_formKey.currentState!.validate()) {
      ProgressDialog.show(context);
      final HttpResponse response = await _authentication.login(
        email: _email.trim(),
        password: _password.trim(),
      );
      ProgressDialog.dismiss(context);
      if (response.data != null) {
        _authenticationClient.saveSession(response.data);
        Navigator.pushNamedAndRemoveUntil(
            context, SplashPage.routeName, (route) => false);
      } else {
        _logger.e(response.error!.data);
        Dialogs.alert(
          context,
          title: "Error",
          description: response.error!.message,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(MyColors.purpleOne),
    );
    const InputDecoration _inputDecoration = InputDecoration(
      labelStyle: TextStyle(
        color: MyColors.purpleOne,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.purpleOne,
        ),
      ),
    );

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 450 : 360,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.orangeAccent,
                ),
              ),
              SizedBox(
                height: responsive.dp(3.5),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black87,
                ),
                validator: (text) {
                  if (!text.toString().trim().contains("@")) {
                    return "invalid email";
                  }
                  return null;
                },
                decoration:
                    _inputDecoration.copyWith(labelText: "Email Address"),
                onChanged: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  color: Colors.black87,
                ),
                validator: (text) {
                  if (text.toString().trim() == "") {
                    return "you must enter a password";
                  }
                  return null;
                },
                obscureText: true,
                decoration: _inputDecoration.copyWith(labelText: "password"),
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: responsive.dp(3),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("LOGIN"),
                    ),
                    style: style,
                  ),
                ),
              ),
              SizedBox(
                height: responsive.dp(1),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: MyColors.ripeOrange,
                ),
              ),
              SizedBox(
                height: responsive.dp(1),
              ),
              const Text(
                "Login with",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: responsive.dp(1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      SocialMedia.facebook,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8),
                      primary: MyColors.purpleOne,
                      onPrimary: MyColors.ripeOrange,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      SocialMedia.google,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8),
                      primary: MyColors.purpleOne,
                      onPrimary: MyColors.ripeOrange,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: responsive.isTablet
                    ? responsive.dp(18.5)
                    : responsive.dp(14.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
