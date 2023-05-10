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
import 'firebase_options.dart';

void main() => runApp(MyApp());
/*Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder:(BuildContext context ,AsyncSnapshot<SharedPreferences> prefs){
            var x=prefs.data;
            if(prefs.hasData){
              bool conn =x?.getBool('connect') ?? false;
              if(conn)
                return HomePage();
            }
            return AuthentificationPage();
          }
      ),
      /*
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return AuthentificationPage();
          }
        },
      ),
       */
    );
  }
}
