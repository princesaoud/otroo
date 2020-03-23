import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otroo/Constants/constants.dart';
import 'package:otroo/UI/Widgets/splash_screen.dart';
import 'package:otroo/UI/main_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Otroo',
      theme: ThemeData(primaryColor: Colors.orange[200]),
      routes: <String, WidgetBuilder>{
        MAIN_UI: (BuildContext context) => MainUI(),
        SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}
