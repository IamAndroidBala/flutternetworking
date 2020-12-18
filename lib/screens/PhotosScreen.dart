

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosScreen extends StatefulWidget {

  PhotosScreen(int id);


  @override
  State<StatefulWidget> createState() => _PhotosPageState();

}

class _PhotosPageState extends State<PhotosScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Photos'),
        centerTitle: true,
      ),
    );

  }

}