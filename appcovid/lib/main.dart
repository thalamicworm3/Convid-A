import 'package:flutter/material.dart';
import 'package:appcovid/menu.dart';
import 'package:appcovid/home/wrapper.dart';
import 'package:appcovid/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:appcovid/menu.dart';
import 'package:provider/provider.dart';
import 'models/usuario.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          title: 'APPCOVID',
          theme: ThemeData(
            primarySwatch: cor,
          ),
          home: Wrapper(),
        ));
  }
}
