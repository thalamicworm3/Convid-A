import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';
import 'package:appcovid/respostatela1.dart';

String opcao='Tem covid';

class Pergunta1 extends StatelessWidget {
  Pergunta1();
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('MENU'),
          backgroundColor: cor,          
        ),
        backgroundColor: Colors.grey,
        body: new Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Teve o diagnóstico confirmado para o Covid-19:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child:MyStatefulWidget()
            ),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              if(opcao=='Tem covid'){
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Respostatela1()),
                                );
                                opcao='Tem covid';
                              }else{
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuScreen()),
                                );
                                opcao='Tem covid';
                              }                              
                            },
                          )
                      );
                    }
                  }
              )
            ),

          ],
        )
        
    );
  }
}

enum SingingCharacter { op1, op2 ,op3}

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
          title: const Text('Tem covid'),
          leading: Radio(
            value: SingingCharacter.op1,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print(_character);
                opcao='Tem covid';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Não tem covid'),
          leading: Radio(
            value: SingingCharacter.op2,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print(_character);
                 opcao='Não tem covid';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Não sabe'),
          leading: Radio(
            value: SingingCharacter.op3,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print(_character);
                 opcao='Não sabe';
              });
            },
          ),
        )
      ],
    );
  }
}
