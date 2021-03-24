import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        toolbarHeight: 80.0,
        title: Text('ListView components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return ListView(
      children: _listItems(),
    );
  }

  List<Widget> _listItems() {
     return [
       ListTile(
         title:Text('Hi world'),
       )

     ];
   }
}
