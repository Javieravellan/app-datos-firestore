import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../usuario.dart';

class Home extends StatefulWidget {
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Agrega cada item al listview.builder dentro de un ListTile
  Widget _buildItem(BuildContext context, DocumentSnapshot data) {

    final Usuario user = new Usuario.fromSnapshot(data);
    
    return ListTile(
      title: Text(user.nameUser),
      subtitle: Text(user.email),
    );
  }


  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) => ListView(
    shrinkWrap: true,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

    children: snapshot.map((data) => _buildItem(context, data)).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('usuarios').snapshots(),

        builder: (context, snapshot) {
          if(!snapshot.hasData) return LinearProgressIndicator();

          return _buildList(context, snapshot.data.documents);
        },
      ),
    );
  }
}