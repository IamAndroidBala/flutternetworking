
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternetworking/apis/Webservice.dart';
import 'package:flutternetworking/models/Album.dart';
import 'package:flutternetworking/screens/PhotosScreen.dart';
import 'package:flutternetworking/utils/Constants.dart';
import 'package:http/http.dart' as http;


class MainScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MainPageState();

}

class _MainPageState extends State<MainScreen>{

  List<Album> _newAlbums = List<Album>();

  @override
  void initState() {
    super.initState();
    _populateAlbums();
  }

  void _populateAlbums() {

    Webservice().load(Album.all).then((newAlbums) => {
      setState(() => {
        _newAlbums = newAlbums
      })
    });

  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: Text(_newAlbums[index].title, style: TextStyle(fontSize: 18, color: Colors.lightBlue)) ,
      onTap:() {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => PhotosScreen(_newAlbums[index].id)));
      } ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: ListView.builder(
          itemCount: _newAlbums.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }

}



