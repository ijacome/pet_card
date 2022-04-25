import 'package:flutter/material.dart';
import 'package:pet_card/utils/responsive.dart';
import 'package:pet_card/widgets/gray_bottom_shape.dart';
import 'package:pet_card/widgets/gray_top_shape.dart';
import 'package:pet_card/widgets/line_shape.dart';
import 'package:pet_card/widgets/login_form.dart';
import 'package:pet_card/widgets/orange_shape.dart';
import 'package:pet_card/widgets/purple_shape.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "login";

  const LoginPage({Key? key}) : super(key: key);

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
              alignment: Alignment.center,
              children: const [
                GrayTopShape(size: 10),
                PurpleShape(size: 10),
                LineShape(size: 10),
                GrayBottomShape(size: 10),
                OrangeShape(size: 10),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
