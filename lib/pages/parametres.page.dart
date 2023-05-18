import 'package:flutter/material.dart';
import 'package:voyage2/menu/drawer.widget.dart';
import 'package:voyage2/config/global.params.dart';
import 'package:firebase_database/firebase_database.dart';

String mode = "Jour";
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();

class ParametresPage extends StatefulWidget {
  @override
  State<ParametresPage> createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title:
          const
          Text
            (
            'Paramètres'
            ,
            style
                :
            TextStyle
              (
              fontSize
                  :
              24.0
              ,
              color
                  :
              Colors
                  .
              white
              ,
              fontWeight
                  :
              FontWeight
                  .
              bold
              ,
            )
            ,
          )
          ,
          centerTitle
              :
          true
          ,
          backgroundColor
              :
          Colors
              .
          teal
          ,
          elevation
              :
          0.0
          ,
          iconTheme
              :
          const
          IconThemeData
            (
              color
                  :
              Colors
                  .
              white
          )
          ,
        )
        ,
        body: Column
            (
            mainAxisAlignment
                :
            MainAxisAlignment
                .
            start
            ,
            children
                :
            <
                Widget
            >[
              ListTile(
                  title: const Text('Jour'),
                  leading: Radio<String>(
                    value: "Jour",
                    groupValue: mode,
                    onChanged: (value) {
                      setState(() {
                        mode = value!;
                      });
                    },
                  )
              ),
              ListTile(
                  title: const Text('Nuit'),
                  leading: Radio<String>(
                    value: "Nuit",
                    groupValue: mode,
                    onChanged: (value) {
                      setState(() {
                        mode = value!;
                      });
                    },
                  )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size.fromHeight(50)
                  ),
                  onPressed: () {
                    _onSaveMode();
                  },
                  child: Text("Enregistrer", style: TextStyle(fontSize: 22),),
                ),
              )
            ],
          ),
    );
  }

  _onSaveMode() async {
    GlobalParams.themeActuel.setMode(mode);
    await ref.set({'mode': mode});
    print("mode appliqué $mode");
    Navigator.pop(context);
  }
}
