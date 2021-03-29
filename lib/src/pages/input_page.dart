import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';

  String _optionSelected = 'php';

  List<String> _skills = ['php', 'java', 'python', 'javascript', 'dart'];

  TextEditingController _inputFieldDateController =
      new TextEditingController(); //cambiar de forma dinamica el textfiel

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
          _createDatePicker(context),
          Divider(),
          _createDropDown(),
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

  Widget _createDatePicker(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false, //no copiar data del input
      controller: _inputFieldDateController, //relacion para editar este widget
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counterStyle: TextStyle(color: Colors.blueAccent),
          hintText: 'Date',
          labelText: 'Date',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context)
            .requestFocus(new FocusNode()); //quitar el focus del input
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    //ya que regresa un Fute se usa aynsc
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = new List();

    _skills.forEach((skill) {
      list.add(DropdownMenuItem(
        child: Text(skill),
        value: skill, //segun el tipo del DropdownMenuItem<String>
      ));
    });

    return list;
  }

  Widget _createDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _optionSelected,
          items: getOptionsDropdown(),
          onChanged: (opt) {
            setState(() {
              _optionSelected = opt;
            });
          },
        )
      ],
    );
  }

  Widget _createPeron() {
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_optionSelected),
    );
  }
}
