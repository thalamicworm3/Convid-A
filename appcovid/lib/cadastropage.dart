import 'package:appcovid/pergunta1.dart';
import 'package:flutter/material.dart';
import 'package:appcovid/models/usuario.dart';

String nomep;
String cursop;
String idadep;
String emailp;
String statuscovid;
String trabalhop;
String telefonep;

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreen createState() => _CadastroScreen();
}

class _CadastroScreen extends State<CadastroScreen> {
  @override
  final nome = TextEditingController();
  final curso = TextEditingController();
  final idade = TextEditingController();
  final email = TextEditingController();
  final trabalho = TextEditingController();
  final telefone = TextEditingController();
  String dropdownValue = 'Escolha um Curso';

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
                  controller: nome,
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
              DropdownButton<String>(
                value: dropdownValue,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  'Escolha um Curso',
                  'Medicina',
                  'Administração',
                  'Ciência da Computação',
                  'Enfermagem',
                  'Engenharia'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 14),
              ),
              TextFormField(
                  controller: idade,
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
                  controller: email,
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
                  controller: trabalho,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "Local de Serviço",
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
                  controller: telefone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "Telefone",
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
                    if (dropdownValue == "Escolha um Curso") {
                      dropdownValue = "Não Selecionado";
                    }
                    setState(() {
                      nomep = nome.text;
                      cursop = dropdownValue;
                      idadep = idade.text;
                      emailp = email.text;
                      trabalhop = trabalho.text;
                      telefonep = telefone.text;
                    });
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
