import 'package:flutter/material.dart';
import 'package:flutter_widget/src/pages/alert_page.dart';
import 'package:flutter_widget/src/providers/menu_provider.dart';
import 'package:flutter_widget/src/utils/icon_string_util.dart';

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
    //cuando no futuro retorna vacio ya que al iniciar aun no carga el json
    // print(menuProvider.options);

    //option para cargar data no recomendable es lenta
    // menuProvider.loadData().then((options) {
    //   print('_list');
    //   print(options);
    // });

    return FutureBuilder(
      future: menuProvider.loadData(), //retorna Future
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {


          Navigator.pushNamed(context, element['ruta']);


          //ruta directa
          // final route= MaterialPageRoute(
          //   builder: (context) =>  AlertPage()
          // );
          // Navigator.push(  context, route);
        },
      );

      options
        ..add(widgetTemp)
        ..add(Divider());
    });

    return options;
  }
}
