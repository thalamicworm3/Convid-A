import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/pergunta1.dart';

Color cor = Colors.red;

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MENU'),
          backgroundColor: cor,
          leading: GestureDetector(
            onTap: _incrementCounter,
            child: Icon(
              Icons.palette, // add custom icons also
            ),
          ),
        ),
        backgroundColor: Colors.grey,
        body: new Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Inicio:",
                //style: TextStyle(fontWeight: FontWeight.bold),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
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
                              "Entrar",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Pergunta1()
                                ),
                              );
                            },
                          ));
                    } else {
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
                                "Opções",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    //  builder: (context) => ComidaScreen01()
                                  ),
                                );
                              },
                            ));
                      }                      
                    }
                  }),
            )
          ],
        )
        );
  }

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


}


