import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GallerieDetailsPage extends StatefulWidget {
  String keyword;

  GallerieDetailsPage(this.keyword);

  @override
  State<GallerieDetailsPage> createState() => _GallerieDetailsPageState();
}

class _GallerieDetailsPageState extends State<GallerieDetailsPage> {
  var gallerieData;
  int currentPage = 1;
  int size = 10;
  List<dynamic> hits = [];
  int totalPages = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getGallerieData(widget.keyword);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          getGallerieData(widget.keyword);
        }
      }
    });
  }

  void getGallerieData(String keyword) {
    print("Gallerie " + keyword);
    String url =
        "https://pixabay.com/api/?key=35399529-7d9735b4c8601edb38c36b8b2&q=$keyword";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.gallerieData = json.decode(resp.body);
        print(this.gallerieData);
        hits.addAll(gallerieData['hits']);
        totalPages = (gallerieData['totalHits'] / size).ceil();
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: totalPages == 0
            ? Text('Pas de résultats')
            : Text(
          '${widget.keyword}, ${currentPage}/${totalPages}',
          style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        child: gallerieData == null
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            controller: _scrollController,
            itemCount: hits.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.teal,
                            Colors.transparent
                          ])),
                      child: Text(
                        "${hits[index]['tags']} ",
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Image.network(
                        hits[index]['webformatURL'],
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
