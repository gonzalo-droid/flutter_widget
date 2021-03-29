import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart'; //formato de idioma
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
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },

      //format idioma
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        // TODO: uncomment the line below after codegen
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'ES'), // Spanish , no country code
        const Locale('en', 'US'), // English , no country code
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
    );
  }
}
