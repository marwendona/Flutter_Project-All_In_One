import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage2/config/global.params.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
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
        /* 1er méthode:
        ListTile(
          title: const Text('Accueil', style: TextStyle(fontSize: 22)),
          leading: const Icon(Icons.home, color: Colors.teal),
          trailing: const Icon(Icons.arrow_right, color: Colors.teal),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/home');
          },
        ),
        const Divider(height: 4, color: Colors.teal),
        ListTile(
          title: const Text('Météo', style: TextStyle(fontSize: 22)),
          leading: const Icon(Icons.sunny_snowing, color: Colors.teal),
          trailing: const Icon(Icons.arrow_right, color: Colors.teal),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/meteo');
          },
        ),
        const Divider(height: 4, color: Colors.teal),
        ListTile(
          title: const Text('Gallerie', style: TextStyle(fontSize: 22)),
          leading: const Icon(Icons.photo, color: Colors.teal),
          trailing: const Icon(Icons.arrow_right, color: Colors.teal),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/gallerie');
          },
        ),
        const Divider(height: 4, color: Colors.teal),
        ListTile(
          title: const Text('Pays', style: TextStyle(fontSize: 22)),
          leading: const Icon(Icons.location_city, color: Colors.teal),
          trailing: const Icon(Icons.arrow_right, color: Colors.teal),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/pays');
          },
        ),
        const Divider(height: 4, color: Colors.teal),
        ListTile(
          title: const Text('Contact', style: TextStyle(fontSize: 22)),
          leading: const Icon(Icons.contact_page, color: Colors.teal),
          trailing: const Icon(Icons.arrow_right, color: Colors.teal),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/contact');
          },
        ),
        const Divider(height: 4, color: Colors.teal),
        ListTile(
          title: const Text('Paramètres', style: TextStyle(fontSize: 22)),
          leading: const Icon(Icons.settings, color: Colors.teal),
          trailing: const Icon(Icons.arrow_right, color: Colors.teal),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/parametres');
          },
        ),
        const Divider(height: 4, color: Colors.teal),
        ListTile(
          title: const Text('Déconnexion', style: TextStyle(fontSize: 22)),
          leading: const Icon(Icons.logout, color: Colors.teal),
          trailing: const Icon(Icons.arrow_right, color: Colors.teal),
          onTap: () async {
            prefs = await SharedPreferences.getInstance();
            prefs.setBool("connecte", false);
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/authentification', (Route<dynamic> route) => false);
          },
        ),
        const Divider(height: 4, color: Colors.teal)
         */
        //2éme méthode:
        //Parcourir les différents éléments du menu
        ...(GlobalParams.menus as List).map((item) {
          return ListTile(
            title: Text(
              '${item['title']}',
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            leading: item['icon'],
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.teal,
            ),
            onTap: () async {
              if ('${item['title']}' != "Déconnexion") {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "${item['route']}");
              } else {
                prefs = await SharedPreferences.getInstance();
                prefs.setBool("connecte", false);
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
