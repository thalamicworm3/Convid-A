import 'package:appcovid/pergunta1.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Cadastro de usuário",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 25)),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "Nome Completo",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autofocus: true,
                  style: new TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 14),
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "Curso",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autofocus: true,
                  style: new TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 14),
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "Idade",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autofocus: true,
                  style: new TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 14),
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autofocus: true,
                  style: new TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 14),
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autofocus: true,
                  style: new TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 14),
              ),
              ButtonTheme(
                height: 50,
                buttonColor: Colors.blue,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pergunta1()),
                    );
                  },
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
