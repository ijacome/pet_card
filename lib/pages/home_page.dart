import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_card/data/authentication_client.dart';
import 'package:pet_card/helpers/http_response.dart';
import 'package:pet_card/models/customers/family.dart';
import 'package:pet_card/models/user.dart';
import 'package:pet_card/pages/login_page.dart';
import 'package:pet_card/repositories/family_repository.dart';
import 'package:pet_card/utils/dialogs.dart';
import 'package:pet_card/utils/my_colors.dart';
import 'package:pet_card/utils/pets_icons.dart';
import 'package:pet_card/widgets/pet_profile.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home";
  final User? user;
  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthenticationClient _authenticationClient =
      GetIt.instance<AuthenticationClient>();
  int _indexNavigatorBar = 2;
  List<Family> _families = [];
  Family? _familySelected;

  @override
  void initState() {
    super.initState();
    _getFamilies();
  }

  _getFamilies() async {
    FamilyRepository familyRepository = FamilyRepository();
    HttpResponse familiesResponse = await familyRepository.myFamilies();
    if (familiesResponse.data != null) {
      _families = familiesResponse.data;
      _familySelected = _families.first;
    } else {
      Dialogs.alert(
        context,
        title: "Error",
        description: familiesResponse.error!.message,
      );
    }
    // print(families);
  }

  @override
  Widget build(BuildContext context) {
    final _items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(
        Icons.search,
        size: 30,
      ),
      const Icon(
        PetsIcons.truck,
        size: 30,
      ),
      const Icon(
        Icons.settings,
        size: 30,
      ),
      const Icon(
        Icons.person,
        size: 30,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white70,
      extendBody: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline,
              color: MyColors.ripeOrange,
            ),
          ),
        ],
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Pet profile",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        elevation: 0,
        backgroundColor: MyColors.purpleOne,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text("Hello, " + widget.user!.name.toString()),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ExpansionTile(
                    title: const Text('Families'),
                    leading: const Icon(Icons.group),
                    subtitle: Text(_familySelected != null
                        ? _familySelected!.name.toString()
                        : '-'),
                    children: _families.map((Family family) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            _familySelected = family;
                          });
                        },
                        selected: family.id == _familySelected!.id,
                        title: Text(family.name.toString()),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                await _authenticationClient.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginPage.routeName,
                  (route) => false,
                );
              },
              child: const Text("Settings"),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: PetProfile(),
        )),
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
