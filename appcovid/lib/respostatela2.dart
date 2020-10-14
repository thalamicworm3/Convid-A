import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';

class Respostatela2 extends StatelessWidget {
  Respostatela2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Resposta: Covid Positivo'),
          backgroundColor: cor,
        ),
        body: new Column(
          children: <Widget>[
            new Image.asset(
              'assets/images/covidpositivo.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 5, bottom: 25),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                child: Text(
                  "Você pode estar infectado pelo novo coronavírus, mesmo que não tenha nenhum sintoma. É muito importante que você use máscara sempre e mantenha o distanciamento social para sua proteção e para proteção das outras pessoas. Se apresentar algum sintoma, como tosse, falta de ar, dor de garganta e alteração do olfato ou paladar, procure atendimento médico.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
            ),
            ButtonTheme(
              height: 50,
              minWidth: 250,
              buttonColor: Colors.blue,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
                child: Text(
                  "Finalizar Consulta",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            )
          ],
        ));
  }
}
