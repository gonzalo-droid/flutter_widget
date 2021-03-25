import 'package:flutter/material.dart';
import 'package:flutter_widget/src/pages/alert_page.dart';
import 'package:flutter_widget/src/pages/avatar_page.dart';
import 'package:flutter_widget/src/pages/home_page.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/', //string ruta
      routes: <String, WidgetBuilder>{
        '/' : (BuildContext context) => HomePage(),
        'alert' : (BuildContext context) => AlertPage(),
        'avatar' : (BuildContext context) => AvatarPage(),
      },
    );
  }
}