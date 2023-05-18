import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage2/config/global.params.dart';

import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
            title: const Text('Home',
                style: TextStyle(color: Colors.white, fontSize: 24)),
            centerTitle: true,
            backgroundColor: Colors.teal),
        body:
        Center(
          child: Wrap(
            children: [
              ...(GlobalParams.acceuil as List).map((item) {
                return InkWell(
                  child: Ink.image(
                    height: 180,
                    width: 180,
                    image: item['image'],
                  ),
                  onTap: () {
                    if ('${item['route']}' != "/authentification") {
                      Navigator.pushNamed(context, "${item['route']}");
                    } else {
                      _Deconnexion(context);
                    }
                  },
                );
              }),
            ],
          ),
        )
    );
  }

  Future<void> _Deconnexion(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
}