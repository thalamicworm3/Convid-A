import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';
import 'package:appcovid/cadastropage.dart';

class Respostatela2 extends StatelessWidget {
  Respostatela2();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Média Chance de Contaminação'),
              backgroundColor: cor,
              automaticallyImplyLeading: false,
            ),
            body: ListView(
              children: <Widget>[
                new Image.asset(
                  'assets/images/conviviopositivo.jpg',
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
                      "Por ter convívio diário com alguém que foi infectado, você também pode estar com o novo coronavírus, sendo ou não sintomático. É muito importante que você use máscara sempre e mantenha o distanciamento social para sua proteção e para proteção das outras pessoas. Se apresentar algum sintoma de risco, como falta de ar e febre procure atendimento médico. (Nome:$nomep | Curso:$cursop | Idade:$idadep | Email:$emailp)",
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
            )));
  }
}
