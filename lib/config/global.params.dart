import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Accueil",
      "icon": const Icon(
        Icons.home,
        color: Colors.teal,
      ),
      "route": "/home"
    },
    {
      "title": "Météo",
      "icon": const Icon(
        Icons.sunny_snowing,
        color: Colors.teal,
      ),
      "route": "/meteo"
    },
    {
      "title": "Gallerie",
      "icon": const Icon(
        Icons.photo,
        color: Colors.teal,
      ),
      "route": "/gallerie"
    },
    {
      "title": "Pays",
      "icon": const Icon(
        Icons.location_city,
        color: Colors.teal,
      ),
      "route": "/pays"
    },
    {
      "title": "Contact",
      "icon": const Icon(
        Icons.contact_page,
        color: Colors.teal,
      ),
      "route": "/contact"
    },
    {
      "title": "Paramétres",
      "icon": const Icon(
        Icons.settings,
        color: Colors.teal,
      ),
      "route": "/parametres"
    },
    {
      "title": "Déconnexicon",
      "icon": const Icon(
        Icons.logout,
        color: Colors.teal,
      ),
      "route": "/authentification"
    },
  ];

  static List<Map<String, dynamic>> accueil = [
    {
      "image": const AssetImage(
        'images/meteo.png',
      ),
      "route": "/meteo"
    },
    {
      "image": const AssetImage(
        'images/gallerie.png',
      ),
      "route": "/gallerie"
    },
    {
      "image": const AssetImage(
        'images/pays.png',
      ),
      "route": "/pays"
    },
    {
      "image": const AssetImage(
        'images/contact.png',
      ),
      "route": "/contact"
    },
    {
      "image": const AssetImage(
        'images/parametres.png',
      ),
      "route": "/parametres"
    },
    {
      "image": const AssetImage(
        'images/deconnexion.png',
      ),
      "route": "/authentification"
    },
  ];
}
