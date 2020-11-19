import 'package:appcovid/cadastropage.dart';
import 'package:appcovid/profilepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/pergunta1.dart';

import 'package:appcovid/services/auth.dart';

Color cor = Colors.blue;

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('Convid-a'),
          backgroundColor: cor,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text('Logout'),
                textColor: Colors.white),
          ],
        ),
        body: new Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pergunta1()),
                    );
                  },
                  child: Column(children: <Widget>[
                    Text(
                      "Iniciar Consulta",
                      style: TextStyle(fontSize: 40.0),
                    ),
                    Icon(
                      Icons.book,
                      size: 50,
                    )
                  ])),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profiletela()),
                    );
                  },
                  child: Column(children: <Widget>[
                    Text(
                      "         Perfil         ",
                      style: TextStyle(fontSize: 40.0),
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 50,
                    )
                  ])),
            ),
          ],
        ));
  }
}
