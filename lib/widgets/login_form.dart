import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/repositories/auth.dart';
import 'package:pet_card/utils/dialogs.dart';
import 'package:pet_card/utils/responsive.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Logger _logger = Logger();
  final Auth _authentication = Auth();
  String _email = '', _password = '';

  _submit() async {
    final isOk  = _formKey.currentState?.validate();
    if (isOk!) {
      // ProgressDialog.show(context);
      final HttpResponse response = await _authentication.login(
        email: _email.trim(),
        password: _password.trim(),
      );
      // ProgressDialog.dismiss(context);
      if (response.data != null) {
        _logger.i(response.data);
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
    final ButtonStyle style =
    ElevatedButton.styleFrom(
        textStyle: TextStyle(
            fontSize: responsive.dp(1.6),
            color: Colors.deepPurple
        ),
        elevation: 2
    );
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 360,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Email Address"),
                onChanged: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: responsive.dp(5),),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text("Sign in"),
                  ),
                  style: style,
                ),
              ),
              SizedBox(height: responsive.dp(10),)
            ],
          ),
        ),
      ),
    );
  }
}
