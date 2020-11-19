import 'package:appcovid/authentication/register.dart';
import 'package:appcovid/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:appcovid/authentication/authenticate.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String senha = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Login'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person_add),
              label: Text('Registrar'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Qual seu E-Mail?',
                      labelText: 'E-Mail',
                    ),
                    validator: (val) => val.isEmpty ? 'Escreva o Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Qual sua Senha?',
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
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Logar', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                          await _auth.logarEmailESenha(email, senha);

                      if (result == null) {
                        setState(() => error = 'Dados Incorretos');
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
