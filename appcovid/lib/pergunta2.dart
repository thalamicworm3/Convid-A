import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';
import 'package:appcovid/respostaTemCovid.dart';

String opcao = 'Tem covid';

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
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Teve contato com alguem que foi diagnosticado com COVID-19",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: MyStatefulWidget()),
            new Expanded(
                child: ListView.builder(
                    itemCount: 1,
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
                                        builder: (context) => Respostatela1()),
                                  );
                                  opcao = 'Sim';
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuScreen()),
                                  );
                                  opcao = 'Não';
                                }
                              },
                            ));
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
