import 'package:flutter/material.dart';
import 'package:appcovid/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APPCOVID',
      theme: ThemeData(
        primarySwatch: cor,
      ),
      home: MenuScreen(),
    );
  }
}
