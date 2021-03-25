import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0), //paddgin en todas las direcciones
        // padding: EdgeInsets.symmetric(horizontal:50.0, vertical:10.0)

        children: <Widget>[_cardType1()],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_business_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      child: Column(children: [
        ListTile(
          title: Text('Cat-House'),
          subtitle: Text(
              "Trinity and Tomas in the night, tommes i need fuck trinity, but she dont like"),
          leading: Icon(Icons.plumbing),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('ok'),
              onPressed: () {},
            )
          ],
        )
      ]),
    );
  }
}
