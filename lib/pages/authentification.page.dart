import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Authentification',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
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
                focusColor: Colors.teal,
                prefixIcon:
                    Icon(Icons.lock_open, color: Colors.teal[300]),
                hintText: "Mot de passe",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(30),
                )),
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
              _onAuthentifier(context);
            },
            child: Text(
              "Connexion",
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.control_point,
                  color: Colors.teal,
                ),
                Text(" Nouvel Utilisateur",
                    style: TextStyle(color: Colors.teal, fontSize: 22)),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/inscription");
            })
      ]),
    );
  }

  Future<void> _onAuthentifier(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: txt_login.text.trim(), password: txt_password.text);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const snackBar = SnackBar(
          content: Text('Utilisateur inexistant.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        const snackBar = SnackBar(
          content: Text('Verifiez votre mot de passe.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
