import 'package:appcovid/cadastropage.dart';
import 'package:appcovid/firebase/cadastro.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/pergunta1.dart';
import 'package:appcovid/firebase/lista_de_cadastro.dart';
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
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('logout'))
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
                      MaterialPageRoute(builder: (context) => CadastroList()),
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

            /*  new Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    switch (index) {
                      /*  case 0:
                        {}
                        break;
 */
                      case 1:
                        {
                          return Container(
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
                                    MaterialPageRoute(
                                        builder: (context) => Cadastro()),
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
                          );
                        }
                        break;

                      case 2:
                        {
                          return Container(
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
                                    MaterialPageRoute(
                                        builder: (context) => Cadastro()),
                                  );
                                },
                                child: Column(children: <Widget>[
                                  Text(
                                    "Opções",
                                    style: TextStyle(fontSize: 40.0),
                                  ),
                                  Icon(
                                    Icons.account_circle,
                                    size: 50,
                                  )
                                ])),
                          );
                        }
                        break;
                    } */

            /* Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          //color: Colors.blueGrey,
                          decoration: BoxDecoration(
                              color: cor,
                              border: Border.all(color: Colors.black)),
                          child: ListTile(
                            
                            title: Text(
                              "Entrar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            
                            ),
                          
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cadastro()),
                              );
                            },
                          )); */
          ],
        ));
  }

/*
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      if ((counter % 2) == 0) {
        cor = Colors.red;
      } else {
        cor = Colors.blue;
      }
    });

    await prefs.setInt('counter', counter);
  }
*/

}
