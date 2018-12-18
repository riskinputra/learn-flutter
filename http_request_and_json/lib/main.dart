import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      home: StarWarsData(),
    )
  );
}

class StarWarsData extends StatefulWidget {
  @override
  StarWarsState createState() => StarWarsState();
}

class StarWarsState extends State<StarWarsData> {
  final String url = "https://swapi.co/api/starships";
  // to create a list item of data
  // so that we can store all data
  // that we're getting from this HTTP request
  List data;

  Future<String> getSWData() async {
    var res = await http
      .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var resbody = json.decode(res.body);
      data = resbody["results"];
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Star Wars Starships"),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Text(data[index]["name"],
                          style:
                            TextStyle(fontSize: 18.0, color: Colors.black54),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Text(data[index]["name"],
                          style:
                          TextStyle(fontSize: 18.0, color: Colors.black54),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getSWData();
  }
}

