import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutternetworking/apis/Webservice.dart';
import 'package:flutternetworking/utils/Constants.dart';
import 'package:flutternetworking/utils/Toaster.dart';

class Album {

  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }

  static Resource<List<Album>> get all {

    return Resource (
        url: Constants.GET_ALBUM,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result;
          return list.map((model) => Album.fromJson(model)).toList();
        }
    );

  }

}