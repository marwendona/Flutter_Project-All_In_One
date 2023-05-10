import 'package:flutter/material.dart';
import 'package:voyage2/menu/drawer.widget.dart';

import 'gallerie-details.page.dart';

class GalleriePage extends StatelessWidget {
  TextEditingController txt_gallerie = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text('Gallerie',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.teal,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background0.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: txt_gallerie,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.photo_library,
                      color: Colors.teal,
                    ),
                    hintText: "keyword",
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    primary: Colors.teal,
                  ),
                  onPressed: () {
                    _onGetGallerieDetails(context);
                  },
                  child: const Text(
                    'chercher',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _onGetGallerieDetails(BuildContext context) {
    String keyword = txt_gallerie.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GallerieDetailsPage(keyword)),
    );
    txt_gallerie.text = "";
  }
}
