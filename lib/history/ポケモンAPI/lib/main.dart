import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const maxNumber = 385;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ポケモン図鑑'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<String> imageUrls;

  @override
  void initState() {
    imageUrls = [];
    fetchImageUrls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        itemCount: imageUrls.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, int index) {
          return SizedBox(
            height: 100,
            child: CachedNetworkImage(
              imageUrl: imageUrls[index],
              placeholder: (context, url) => Center(
                child: new CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchImageUrls() async {
    for (int index = 1; index <= maxNumber; index++) {
      final url = 'http://pokeapi.co/api/v2/pokemon/$index/';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        final imageUrl = jsonResponse['sprites']['front_default'];
        setState(() {
          imageUrls.add(imageUrl);
        });
      } else {
        throw Exception('Failed to fetch image URL');
      }
    }
  }
}
