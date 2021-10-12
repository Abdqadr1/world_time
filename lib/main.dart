import 'package:flutter/material.dart';
import 'package:world_time/screens/EditLocation.dart';
import 'package:world_time/screens/Home.dart';
import 'package:world_time/screens/Loading.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => EditLocation(),
  },
));

