import 'package:flutter/material.dart';
import 'package:app_firestore/mainapp/mainwidget.dart';

/*
 * en home mostraremos todos los usuarios que se encuentran en la base de datos
 * con su nombre de usuario y su correo electronico un lista
 * 
 * en la sección de comentarios mostraremos una tarjeta para
 * cada usuario, en la cual estará el nombre del usuario, el comentario y la fecha del comentario.
 * 
 * En la parte de fotos (inicialmente no estará) mostraremos la foto del usuario
 * y el nombre del usuario al que la foto pertenece..
 * 
 * la estructura de la app será cada pestaña con un tabBar
 */

void main() => runApp(new MyClientListApp());

class MyClientListApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) => new MaterialApp(
    title: 'List Customers',
    theme: ThemeData(
      primaryColor: Colors.red,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),
        bodyText1: TextStyle(
          color: Colors.brown, 
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 12,
        ),
      ),
    ),
    home: MainWidget(),
  );
}