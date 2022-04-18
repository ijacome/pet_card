import 'package:flutter/material.dart';
import 'package:pet_card/utils/responsive.dart';
import 'package:pet_card/widgets/login_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super (key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

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