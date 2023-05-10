import 'package:flutter/material.dart';
import 'package:voyage2/menu/drawer.widget.dart';

class PaysPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
          title: const Text('Pays',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          centerTitle: true,
          backgroundColor: Colors.teal),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background0.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Page Pays',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
