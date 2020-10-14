import 'package:appcovid/pergunta3.dart';
import 'package:appcovid/respostatela2.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';

String opcao = 'Sim';

class Pergunta2 extends StatelessWidget {
  Pergunta2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('2ª Pergunta'),
          backgroundColor: cor,
        ),
        body: new Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(13),
              child: Text(
                "Mora ou trabalha com alguém que apresentou diagnóstico para Covid-19, nos últimos 15 dias:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container( 
                padding: const EdgeInsets.only(bottom: 8),
                child: MyStatefulWidget()),
            new Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            //color: Colors.blueGrey,
                            decoration: BoxDecoration(
                                color: cor,
                                border: Border.all(color: Colors.black)),
                            child: ListTile(
                              title: Text(
                                "Enviar Resposta",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onTap: () {
                                if (opcao == 'Sim') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Respostatela2()),
                                  );
                                  opcao = 'Sim';
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pergunta3()),
                                  );
                                  opcao = 'Sim';
                                }
                              },
                            ));
                      }else {
                        if (index == 1) {
                          return Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              //color: Colors.blueGrey,
                              decoration: BoxDecoration(
                                  color: cor,
                                  border: Border.all(color: Colors.black)),
                              child: ListTile(
                                title: Text(
                                  "Volta ao Menu",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuScreen()),
                                  );
                                  opcao = 'Sim';
                                },
                              ));
                        }
                      }
                    })),
          ],
        ));
  }
}

enum SingingCharacter { op1, op2 }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.op1;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Sim'),
          leading: Radio(
            value: SingingCharacter.op1,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print(_character);
                opcao = 'Sim';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Não'),
          leading: Radio(
            value: SingingCharacter.op2,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print(_character);
                opcao = 'Não';
              });
            },
          ),
        ),
      ],
    );
  }
}
