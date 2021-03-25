import 'package:flutter/material.dart';

import 'package:flutter_widget/src/pages/alert_page.dart';
import 'package:flutter_widget/src/route/route.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/', //string ruta
      routes: getApplicationRoutes(),
      //en caso no encuentre ruta mapeada
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}