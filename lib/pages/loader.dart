import 'dart:async';

import 'package:flutter/material.dart';
import 'package:world_map/pages/loader.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  /*void getData() async {
    await Future.delayed(Duration(seconds:3),(){
      print('yoshi');
    });

  }

  void initState() async {
    // TODO: implement initState
    super.initState();
    getData();
    Navigator.pushNamed(context, '/location');
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
        backgroundColor: Color(0xFF4CAF50),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),

            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}


/*return Scaffold(
appBar: AppBar(
title: Text('Loading'),
backgroundColor: Color(0xFF4CAF50),
centerTitle: true,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
CircularProgressIndicator(),
getData(),
SizedBox(
height: 15,
),
],
),
),
);*/