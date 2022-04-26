import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/pages/login_page.dart';
import 'package:pet_card/utils/my_colors.dart';
import 'package:pet_card/utils/pets_icons.dart';
import 'package:pet_card/utils/responsive.dart';

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
    final _items = <Widget>[
      const Icon(Icons.home, size: 30,),
      const Icon(Icons.search, size: 30,),
      const Icon(PetsIcons.truck, size: 35,),
      const Icon(Icons.settings, size: 30,),
      const Icon(Icons.person, size: 30,),
    ];
    int _indexNavigatorBar = 2;


    return Scaffold(
      backgroundColor: Colors.white70,
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(child: Text("I am"),),
            TextButton(
              onPressed: () async {
                await _authenticationClient.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginPage.routeName, (route) => false,
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            child: Row(
              children: const [
                Card(
                  child: Text("Age"),
                )
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: MyColors.purpleOne),
        ),
        child: CurvedNavigationBar(
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          color: MyColors.ripeOrange,
          height: Platform.isAndroid ? 52 : 75,
          items: _items,
          index: _indexNavigatorBar,
          onTap: (value) {
            setState(() {
              _indexNavigatorBar = value;
            });
          },
        ),
      ),
    );
  }

}