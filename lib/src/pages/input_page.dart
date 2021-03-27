import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs Page')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createdName(),
          Divider(),
          _createdEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createPeron(),
          
        ],
      ),
    );
  }

  Widget _createdName() {
    return TextField(
      // autofocus: true, //auto seleccionado
      textCapitalization: TextCapitalization.sentences,

      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Words ${_name.length}'),
          counterStyle: TextStyle(color: Colors.blueAccent),
          hintText: 'Username',
          labelText: 'Name',
          helperText: 'input username',
          suffixIcon: Icon(Icons.accessible),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) => setState(() {
        _name = value;
      }),
    );
  }

  Widget _createdEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress, //validar segun tipo de dato
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counterStyle: TextStyle(color: Colors.blueAccent),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  
  Widget _createPassword() {
     return TextField(
       obscureText: true, //no mostrar texto del pass
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counterStyle: TextStyle(color: Colors.blueAccent),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) => setState(() {
        _password = value;
      }),
    );
  }


  Widget _createPeron() {
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email es: $_email'),
    );
  }

  

}
