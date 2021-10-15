import 'package:flutter/material.dart';

class FavoritiesScreen extends StatefulWidget{
  @override
  _FavoritiesScreenState createState() => _FavoritiesScreenState();
}

class _FavoritiesScreenState extends State<FavoritiesScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Favorities Screen"),),
    );
  }
}