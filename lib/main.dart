import 'package:flutter/material.dart';
import 'package:shop_app/models/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
    },
  ));
}