import 'package:flutter/material.dart';
import 'package:pet_card/utils/responsive.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

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
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "EMAIL ADDRESS"),
            ),
            SizedBox(height: responsive.dp(5),),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {},
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
    );
  }
}
