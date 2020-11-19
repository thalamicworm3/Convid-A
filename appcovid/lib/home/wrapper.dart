import 'package:appcovid/menu.dart';
import 'package:flutter/material.dart';
import 'package:appcovid/authentication/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:appcovid/models/usuario.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return MenuScreen();
    }
  }
}
