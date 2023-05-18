import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage2/config/global.params.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.only(top: 100.0),
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jfif"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("images/profil.jpg"),
              radius: 80,
            ),
          ),
        ),
        //Parcourir les différents éléments du menu
        ...(GlobalParams.menus as List).map((item) {
          return ListTile(
            title: Text(
              '${item['title']}',
              style: const TextStyle(fontSize: 22, color: Colors.teal),
            ),
            leading: item['icon'],
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.teal,
            ),
            onTap: () async {
              if ('${item['title']}' != "Deconnexion") {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '${item['route']}');
              } else {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/authentification', (Route<dynamic> route) => false);
              }
            },
          );
        })
      ],
    ));
  }
}
