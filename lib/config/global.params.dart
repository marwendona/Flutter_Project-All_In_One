import 'package:flutter/material.dart';
import '../notifier/theme.dart';

class GlobalParams {
  static MonTheme themeActuel = MonTheme();
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Accueil",
      "icon": const Icon(
        Icons.home,
        color: Colors.deepPurpleAccent,
      ),
      "route": "/home"
    },
    {
      "title": "Méteo",
      "icon": const Icon(
        Icons.sunny_snowing,
        color: Colors.deepPurpleAccent,
      ),
      "route": "/meteo"
    },
    {
      "title": "Gallerie",
      "icon": const Icon(
        Icons.photo,
        color: Colors.deepPurpleAccent,
      ),
      "route": "/gallerie"
    },
    {
      "title": "Pays",
      "icon": const Icon(
        Icons.location_city,
        color: Colors.deepPurpleAccent,
      ),
      "route": "/pays"
    },
    {
      "title": "Contact",
      "icon": const Icon(
        Icons.contact_page,
        color: Colors.deepPurpleAccent,
      ),
      "route": "/contact"
    },
    {
      "title": "Paraméters",
      "icon": const Icon(
        Icons.settings,
        color: Colors.deepPurpleAccent,
      ),
      "route": "/parametres"
    },
    {
      "title": "Deconnexion",
      "icon": const Icon(
        Icons.logout,
        color: Colors.deepPurpleAccent,
      ),
      "route": "/authentification"
    },
  ];
  static List<Map<String, dynamic>> acceuil = [
    {
      "image": const AssetImage(
        "images/meteo.png",
      ),
      "route": "/meteo"
    },
    {
      "image": const AssetImage(
        "images/gallerie.png",
      ),
      "route": "/gallerie"
    },
    {
      "image": const AssetImage(
        "images/pays.png",
      ),
      "route": "/pays"
    },
    {
      "image": const AssetImage(
        "images/contact.png",
      ),
      "route": "/contact"
    },
    {
      "image": const AssetImage(
        "images/parametres.png",
      ),
      "route": "/parametres"
    },
    {
      "image": const AssetImage(
        "images/deconnexion.png",
      ),
      "route": "/authentification"
    },
  ];
}
