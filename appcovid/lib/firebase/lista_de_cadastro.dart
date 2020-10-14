import 'package:appcovid/cadastropage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:appcovid/firebase/lista_de_cadastro.dart';
import 'package:appcovid/firebase/add_cadastro.dart';
import 'package:appcovid/firebase/data_cadastro.dart';
import 'package:appcovid/firebase/cadastro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';
import 'package:appcovid/main.dart';

//Color cor=Colors.red;

class CadastroList extends StatefulWidget {
  @override
  _CadastroListState createState() => _CadastroListState();
}

class _CadastroListState extends State<CadastroList> {
  final CadastroRepository repository = CadastroRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Sugestões"),backgroundColor: cor,
        /*
        leading: GestureDetector(
          onTap: _incrementCounter,
          child: Icon(
            Icons.palette, // add custom icons also
          ),
        ),
        */
      ),
      backgroundColor: Colors.grey,
      body: StreamBuilder<QuerySnapshot>(
          stream: repository.getStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LinearProgressIndicator();
            }
            return _buildList(context, snapshot.data.documents);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cor,
        onPressed: () {
          _addSugestao();
        },
        tooltip: 'Adicionar nova Sugestão',
        child: Icon(Icons.add),
      ),
    );
  
  }
  //define a cor
  /*
  _incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;

  setState(() {
    if((counter % 2)==0){
    cor=Colors.red;
  }else{
    cor=Colors.blue;
  }
  });  

  await prefs.setInt('counter', counter);

  }
  */

  void _addSugestao() {
    //add_screen
    AlertDialogWidget dialogWidget = AlertDialogWidget();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add Sugestão"),
            content: dialogWidget,
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    Cadastro novoCadastro = Cadastro(
                        nomep,
                        curso: cursop,
                        idade: idadep,
                        email: emailp,
                        statuscovid: dialogWidget.aplicativoStatuscovid);
                        repository.addSugestao(novoCadastro);
                    Navigator.of(context).pop();
                  },
                  child: Text("Adicionar"))
            ],
          );
        });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final cadastro = Cadastro.fromSnapshot(snapshot);
    if (cadastro == null) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      //color: Colors.blueGrey,
      decoration: BoxDecoration(
          color: cor, border: Border.all(color: Colors.black)),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                child: Text.rich(
                  TextSpan(
                    text: "Nome: " + cadastro.nome,
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // default text style
                    children: <TextSpan>[
                      TextSpan(
                          text: " | Status: " + cadastro.statuscovid,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Container(
                    child: FlatButton(
                  onPressed: () {
                    _removeSugestao(cadastro);
                  },
                  child: Icon(Icons.remove_circle),
                )))
            /*Expanded(
              child: Text.rich(
                TextSpan(
                  text: "Nome: "+personagem.nome,
                  style: TextStyle(
                      fontWeight: FontWeight.bold), // default text style
                  children: <TextSpan>[
                    TextSpan(
                        text: " | Classe: "+personagem.classe,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: " | Nivel: "+personagem.nivel,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Expanded(
                child: FlatButton(
              onPressed: () {
                _removePersonagem(personagem);
              },
              child: Icon(Icons.remove_circle),
            ))*/
          ],
        ),
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => CarroDetalhes(carro)));
        },
      ),
      //padding: EdgeInsets.all(2.0),
    );
  }

  void _removeSugestao(Cadastro cadastro) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Remove Sugestão"),
            content: Text("Tem certeza?"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    repository.removeSugestao(cadastro);
                  },
                  child: Text("Remover"))
            ],
          );
        });
  }
}
