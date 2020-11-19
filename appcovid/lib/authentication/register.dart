import 'package:appcovid/services/auth.dart';
import 'package:flutter/material.dart';
import 'authenticate.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

String nomep;
String cursop;
String idadep;
String emailp;
String statuscovid;
String trabalhop;
String telefonep;

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String senha = '';
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
    setState(() {
      val = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Cadastro'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Login'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Qual seu E-mail?',
                      labelText: 'E-mail',
                    ),
                    validator: (val) => val.isEmpty ? 'Escreva o E-mail' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Escolha uma Senha',
                      labelText: 'Senha',
                    ),
                    validator: (val) => val.length < 6
                        ? 'Digite senha com mais de 6 letras'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => senha = val);
                    }),
                SizedBox(height: 20.0),
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
                Text(
                  "Estudante / Funcionário",
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 200,
                  child: Switch(
                      value: val,
                      onChanged: (value) {
                        setState(() {
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
                            dropdownValue = 'Escolha uma Ocupação';
                            lista = [
                              'Escolha uma Ocupação',
                              'Administrativo',
                              'Professor',
                              'Limpeza',
                              'Lanchonete'
                            ];
                          }
                        });
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
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: lista.map<DropdownMenuItem<String>>((String value) {
                    setState(() {});
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
                  child:
                      Text('Registrar', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (dropdownValue == "Escolha um Curso" ||
                        dropdownValue == "Escolha um Cargo" ||
                        nome.text == "" ||
                        idade.text == "" ||
                        telefone.text == "") {
                      setState(() => error = 'Preencha todos os campos');
                    } else {
                      nomep = nome.text;
                      cursop = dropdownValue;
                      idadep = idade.text;
                      trabalhop = trabalho.text;
                      telefonep = telefone.text;

                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.registrarEmailESenha(email,
                            senha, nomep, idadep, telefonep, cursop, trabalhop);
                        if (result == null) {
                          setState(() => error = 'E-mail já cadastrado');
                        }
                      }
                    }
                  },
                ),
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
}
