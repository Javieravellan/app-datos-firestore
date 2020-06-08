import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/*
 * en la sección de comentarios mostraremos una tarjeta para
 * cada usuario, en la cual estará el nombre del usuario, el comentario y la fecha del comentario.
 * 
 */
import '../usuario.dart';

class Coments extends StatefulWidget {
  @override 
  _ComentsState createState() => _ComentsState();
}

// SubClase  DE STATE
class _ComentsState extends State<Coments> {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('comentarios').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return new LinearProgressIndicator();

          return _buildList(context, snapshot.data.documents);
        }
      ),
    );
  }

  // Construye la lista
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) => ListView(
    shrinkWrap: true,
    children: snapshot.map((data)=>_buildItem(context, data)).toList(),
  );

  // Construye los items de la lista  dentro de un card
  Widget _buildItem(BuildContext context, DocumentSnapshot data) {
    final Comentario comentario = new Comentario.fromSnapshot(data);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(comentario.nameUser, style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(comentario.content),
            ),

            Container(
              padding: EdgeInsets.only(top: 10.0),
              alignment: Alignment.centerRight,
              child: Text(comentario.date, style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        )
      ),
    );
  }
}