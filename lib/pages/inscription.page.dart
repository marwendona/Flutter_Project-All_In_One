import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/authentification');
          },
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            onTap: () {},
            controller: txt_login,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(30)),
                prefixIcon: Icon(Icons.person, color: Colors.teal[300]),
                hintText: "Utilisateur",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            obscureText: true,
            controller: txt_password,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(30)),
                prefixIcon:
                    Icon(Icons.lock_open, color: Colors.teal[300]),
                hintText: "Mot de passe",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Colors.teal,
            ),
            onPressed: () {
              _onInscrire(context);
            },
            child: Text(
              "Inscription",
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login,
                  color: Colors.teal,
                ),
                Text(" Compte Existant",
                    style: TextStyle(color: Colors.teal, fontSize: 22)),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/authentification");
            }),
      ]),
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (txt_login.text.isNotEmpty && txt_password.text.isNotEmpty) {
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_password.text);
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, "/home");
    } else {
      const snackBar = SnackBar(
        content: Text("Id ou mot de passe vides"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
