import 'package:flutter/material.dart';
import './pages/coments.dart';
import './pages/home.dart';
import './pages/photo.dart';

class MainWidget extends StatefulWidget {

  @override 
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with SingleTickerProviderStateMixin {

  TabController _tabController;

  final List<Tab> _tabs = [
    new Tab(
      icon: Icon(Icons.home,),
    ),
    new Tab(
      icon: Icon(Icons.comment,)
    ),
    new Tab(
      icon: Icon(Icons.photo,)
    )

  ];

  @override 
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabs.length, vsync: this);
  }
  
  @override 
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Home Page'),
      bottom: TabBar(
        controller: _tabController,
        tabs: _tabs,
        indicatorColor: Colors.white,
        onTap: (index){},
      ),
    ),

    body: new TabBarView(
      controller: _tabController,
      children: <Widget>[
        new Home(),
        new Coments(),
        new Photo()
      ],
    ),
  );
}