import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert'),
          color: Colors.blue,
          textColor:Colors.white,
          shape: StadiumBorder(),//border
          onPressed: () => _showAlert(context),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){
          Navigator.pop(context); //btn de regresar
        },
      ),
    );
  }

  void _showAlert(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: true, //cerrar el dialog al hacer clic fuera
      builder: (context){

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('Title'),
          content: Column(
            mainAxisSize:  MainAxisSize.min, // se adapta al contenido interno
            children: [
            Text('testtest test testtest'),
            FlutterLogo(
              size:100.0
            )
          ],),
          actions: [
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }

    );
  }
}
