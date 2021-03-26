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

        children: <Widget>[
          _cardType1(),
          SizedBox(height:10.0),
          _cardType2(),
          SizedBox(height:10.0),
          _cardType1(),
          SizedBox(height:10.0),
          _cardType2(),
          SizedBox(height:10.0),
          _cardType1(),
          SizedBox(height:10.0),
          _cardType2(),
          SizedBox(height:10.0),
          _cardType1(),
          SizedBox(height:10.0),
          _cardType2(),
          SizedBox(height:10.0),
        ],
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
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: [
        ListTile(
          contentPadding: EdgeInsets.all(20.0) ,
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

  Widget _cardType2(){
    final card= Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children:[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image:NetworkImage('https://wallpaperaccess.com/full/3048921.jpg'),
            fadeInDuration: Duration(milliseconds: 200), //duracion en llamada de imagen
            height: 250.0, // static height
            fit: BoxFit.cover, //se ajuste al contrainr
          ),

          //trae img sin img de carga
          // Image(
          //   image:NetworkImage('https://wallpaperaccess.com/full/3048921.jpg')
          // ),
          
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tendo idea de que hacer'),

          ),
        ]
      ),
    );
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26, //numero indica el numero de opacidad
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 5.0) ,
          )
        ]
        
      ),
      child: ClipRRect(//CORTA lo que se sale del contenedor
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
