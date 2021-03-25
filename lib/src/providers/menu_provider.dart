import 'dart:convert';

import 'package:flutter/services.dart'
    show rootBundle; //especifico que exportar

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    // loadData();
  }

  //necesitamos que primero se llene el options para luego lo llame en el home_page

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    options = dataMap['rutas'];

    return options;
  }
}

final menuProvider = new _MenuProvider();
