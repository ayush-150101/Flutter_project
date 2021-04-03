import 'package:flutter/material.dart';
import 'package:world_map/pages/choose_location.dart';
import 'package:world_map/pages/home.dart';
import 'package:world_map/pages/loader.dart';
import 'package:world_map/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),

    },
  ));
}

