import 'package:appcovid/respostafim.dart';
import 'package:appcovid/respostatela3.dart';
import 'package:flutter/material.dart';

class Pergunta3 extends StatefulWidget {
  @override
  _Pergunta3State createState() => _Pergunta3State();
}

class _Pergunta3State extends State<Pergunta3> {
  bool chkfebre = false;
  bool chkdorgarganta = false;
  bool chkdorcabeca = false;
  bool chkolfato = false;
  bool chkpaladar = false;
  bool chkdiarreia = false;
  bool chkrespira = false;
  bool chksemsintoma = false;
  int mediana = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3º Pergunta'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(13),
            child: Text(
              "Apresenta algum dos sintomas abaixo:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          CheckboxListTile(
            title: Text("Febre"),
            value: chkfebre,
            onChanged: (value) {
              setState(() {
                chkfebre = value;
                if (chkrespira == true) {
                  mediana = mediana + 3;
                } else {
                  mediana = mediana - 3;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Alteração no paladar"),
            value: chkpaladar,
            onChanged: (value) {
              setState(() {
                chkpaladar = value;
                if (chkpaladar == true) {
                  mediana++;
                } else {
                  mediana--;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Dor de garganta"),
            value: chkdorgarganta,
            onChanged: (value) {
              setState(() {
                chkdorgarganta = value;
                if (chkrespira == true) {
                  mediana = mediana + 2;
                } else {
                  mediana = mediana - 2;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Dor de cabeça"),
            value: chkdorcabeca,
            onChanged: (value) {
              setState(() {
                chkdorcabeca = value;
                if (chkdorcabeca == true) {
                  mediana++;
                } else {
                  mediana--;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Falta de ar ou dificuldade em respirar"),
            value: chkrespira,
            onChanged: (value) {
              setState(() {
                chkrespira = value;
                if (chkrespira == true) {
                  mediana = mediana + 3;
                } else {
                  mediana = mediana - 3;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Alteração no olfato"),
            value: chkolfato,
            onChanged: (value) {
              setState(() {
                chkolfato = value;
                if (chkolfato == true) {
                  mediana++;
                } else {
                  mediana--;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Diarréia"),
            value: chkdiarreia,
            onChanged: (value) {
              setState(() {
                chkdiarreia = value;
                if (chkdiarreia == true) {
                  mediana++;
                } else {
                  mediana--;
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Nenhum sintoma"),
            value: chksemsintoma,
            onChanged: (value) {
              setState(() {
                chksemsintoma = value;
                if (chksemsintoma) {
                  chkfebre = false;
                  chkdorgarganta = false;
                  chkrespira = false;
                  chkpaladar = false;
                  chkolfato = false;
                  chkdiarreia = false;
                  chkdorcabeca = false;
                }
              });
            },
          ),
          ButtonTheme(
            height: 50,
            buttonColor: Colors.blue,
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              color: Colors.blue,
              onPressed: () {
                if (chkfebre ||
                    chkdorgarganta ||
                    chkdiarreia ||
                    chkolfato ||
                    chkpaladar ||
                    chkdorcabeca) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Respostatela3()),
                  );
                } else if (chksemsintoma) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Respostafim()),
                  );
                }
              },
              child: Text(
                "Cadastrar Mediana: $mediana",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
