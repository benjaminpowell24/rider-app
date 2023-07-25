import 'package:flutter/material.dart';

class JsonParse extends StatefulWidget {

  JsonParse() : super();

  @override
  _JsonParseState createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
    );
  }
}
