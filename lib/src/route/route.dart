import 'package:flutter/material.dart';
import 'package:flutter_widget/src/pages/alert_page.dart';
import 'package:flutter_widget/src/pages/animated_container.dart';
import 'package:flutter_widget/src/pages/avatar_page.dart';
import 'package:flutter_widget/src/pages/card_page.dart';
import 'package:flutter_widget/src/pages/home_page.dart';
import 'package:flutter_widget/src/pages/input_page.dart';
import 'package:flutter_widget/src/pages/listview_page.dart';
import 'package:flutter_widget/src/pages/slider_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
        '/' : (BuildContext context) => HomePage(),
        'alert' : (BuildContext context) => AlertPage(),
        AvatarPage.pageName : (BuildContext context) => AvatarPage(),
        'card' : (BuildContext context) => CardPage(),
        'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
        'inputs': (BuildContext context) => InputPage(),
        'slider': (BuildContext context) => SliderPage(),
        'list': (BuildContext context) => ListViewPage(),
        
      };
}
