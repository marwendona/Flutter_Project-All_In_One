import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voyage2/pages/contact.page.dart';
import 'package:voyage2/pages/gallerie.page.dart';
import 'package:voyage2/pages/inscription.page.dart';
import 'package:voyage2/pages/authentification.page.dart';
import 'package:voyage2/pages/home.page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage2/pages/meteo.page.dart';
import 'package:voyage2/pages/parametres.page.dart';
import 'package:voyage2/pages/pays.page.dart';
import 'config/global.params.dart';
import 'firebase_options.dart';
import 'package:voyage2/config/global.params.dart';

ThemeData theme = ThemeData.light();

//void main() => runApp(MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GlobalParams.themeActuel.setMode(await _onGetMode());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = {
    '/home': (context) => HomePage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/meteo': (context) => MeteoPage(),
    '/gallerie': (context) => GalleriePage(),
    '/pays': (context) => PaysPage(),
    '/contact': (context) => ContactPage(),
    '/parametres': (context) => ParametresPage(),
  };

  @override
  void initState() {
    super.initState();
    GlobalParams.themeActuel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GlobalParams.themeActuel.getTheme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return HomePage();
            else
              return AuthentificationPage();
          }),
    );
  }
}

Future<String> _onGetMode() async {
  final snapshot = await ref.child("mode").get();
  if (snapshot.exists) {
    snapshot.value.toString();
  } else {
    mode = "Jour";
  }
  print(mode);
  return mode;
}
