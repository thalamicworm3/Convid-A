import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';




class Respostatela1 extends StatelessWidget {
  Respostatela1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tem covid'),
          backgroundColor: cor,
        ),
        backgroundColor: Colors.grey,
        body: new Column(
          children: <Widget>[
            /*new Image.asset(
              'images/zap.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Colocar menssagem",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
      ],
        ));
  }
}
