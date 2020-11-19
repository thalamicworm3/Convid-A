import 'package:appcovid/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:appcovid/authentication/authenticate.dart';
import 'package:appcovid/models/usuario.dart';
import 'package:appcovid/firebase/profile.dart';
import 'package:provider/provider.dart';
import 'package:appcovid/profilepage.dart';

class AlterarPerfil extends StatefulWidget {
  final Function toggleView;
  AlterarPerfil({this.toggleView});

  @override
  _AlterarPerfilState createState() => _AlterarPerfilState();
}

String nomep;
String cursop;
String idadep;
String emailp;
String statuscovid;
String trabalhop;
String telefonep;

class _AlterarPerfilState extends State<AlterarPerfil> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final nome = TextEditingController();

  final curso = TextEditingController();
  final idade = TextEditingController();
  final trabalho = TextEditingController();
  final telefone = TextEditingController();

  String dropdownValue = 'Escolha um Curso';
  String error = '';
  bool val = false;

  List<String> lista = [
    'Escolha um Curso',
    'Medicina',
    'Administração',
    'Ciência da Computação',
    'Enfermagem',
    'Engenharia',
    'Direito',
    'Agronomia',
    'Veterinaria',
    'Odonto',
    'Estetica'
  ];

  onSwitchValueBool(bool newVal) {
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          val = newVal;
        }));
  }

  String _nomeAtual,
      _emailAtual,
      _idadeAtual,
      _ocupacaoAtual,
      _telefoneAtual,
      _statuscovidAtual;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot != null && !snapshot.hasError) {
            UserData userData = snapshot.data;

            _nomeAtual = userData.nome;
            _emailAtual = userData.email;
            _idadeAtual = userData.idade;
            _ocupacaoAtual = userData.cargo;
            _telefoneAtual = userData.telefone;

            nome.text = "$_nomeAtual";
            idade.text = "$_idadeAtual";
            curso.text = "$_ocupacaoAtual";
            telefone.text = "$_telefoneAtual";
            return Scaffold(
              backgroundColor: Colors.blue[100],
              appBar: AppBar(
                backgroundColor: Colors.blue,
                elevation: 0.0,
                title: Text('Cadastro'),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        SizedBox(height: 20.0),
                        Padding(padding: EdgeInsets.only(bottom: 25)),
                        TextFormField(
                            controller: nome,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                            controller: idade,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                            controller: telefone,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                        Text(
                          "Estudante / Funcionário",
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          width: 200,
                          child: Switch(
                              value: val,
                              onChanged: (value) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) => setState(() {
                                          val = value;
                                          lista = [];
                                          if (val == false) {
                                            dropdownValue = 'Escolha um Curso';
                                            lista = [
                                              'Escolha um Curso',
                                              'Medicina',
                                              'Administração',
                                              'Ciência da Computação',
                                              'Enfermagem',
                                              'Engenharia',
                                              'Direito',
                                              'Agronomia',
                                              'Veterinaria',
                                              'Odonto',
                                              'Estetica'
                                            ];
                                          } else if (val == true) {
                                            dropdownValue =
                                                'Escolha uma Ocupação';
                                            lista = [
                                              'Escolha uma Ocupação',
                                              'Administrativo',
                                              'Professor',
                                              'Limpeza',
                                              'Lanchonete'
                                            ];
                                          }
                                        }));
                              }),
                        ),
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
                            WidgetsBinding.instance
                                .addPostFrameCallback((_) => setState(() {
                                      dropdownValue = newValue;
                                    }));
                          },
                          items: lista
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 14),
                        ),
                        RaisedButton(
                            color: Colors.blue,
                            child: Text('Alterar',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () async {
                              if (nome.text == "") {
                                nomep = userData.nome;
                              } else {
                                nomep = nome.text;
                              }
                              if (dropdownValue == "Escolha um Curso" ||
                                  dropdownValue == "Escolha um Cargo") {
                                cursop = userData.cargo;
                              } else {
                                cursop = dropdownValue;
                              }
                              if (idade.text == "") {
                                idadep = userData.idade;
                              } else {
                                idadep = idade.text;
                              }
                              if (telefone.text == "") {
                                telefonep = userData.telefone;
                              } else {
                                telefonep = telefone.text;
                              }

                              await DatabaseService(uid: user.uid)
                                  .updateUserData(
                                      _nomeAtual = nomep,
                                      _ocupacaoAtual = cursop,
                                      _idadeAtual = idadep,
                                      _emailAtual ?? userData.email,
                                      _telefoneAtual = telefonep,
                                      _statuscovidAtual ??
                                          userData.statuscovids);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profiletela()),
                              );
                            }),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    )),
              ),
            );
          }
        });
  }
}
