import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertDialogWidget extends StatefulWidget{

  String aplicativoNome;
  String aplicativoCurso;
  String aplicativoIdade;
  String aplicativoEmail;
  String aplicativoStatuscovid;

  @override
  _AlertDialogWidgetState createState()=>_AlertDialogWidgetState();

}

class _AlertDialogWidgetState extends State<AlertDialogWidget>{

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Nome"
            ),
            onChanged: (text) => widget.aplicativoNome = text,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Curso"
            ),
            onChanged: (text) => widget.aplicativoCurso = text,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Idade"
            ),
            onChanged: (text) => widget.aplicativoIdade = text,
          ), 
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Email"
            ),
            onChanged: (text) => widget.aplicativoEmail = text,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Status Covid"
            ),
            onChanged: (text) => widget.aplicativoStatuscovid = text,
          ),           
        ],
      ),
    );
  }
}