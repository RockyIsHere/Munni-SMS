import 'package:Munni/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: const Color.fromRGBO(105, 72, 157, .1),
      100: const Color.fromRGBO(105, 72, 157, .2),
      200: const Color.fromRGBO(105, 72, 157, .3),
      300: const Color.fromRGBO(105, 72, 157, .4),
      400: const Color.fromRGBO(105, 72, 157, .5),
      500: const Color.fromRGBO(105, 72, 157, .6),
      600: const Color.fromRGBO(105, 72, 157, .7),
      700: const Color.fromRGBO(105, 72, 157, .8),
      800: const Color.fromRGBO(105, 72, 157, .9),
      900: const Color.fromRGBO(105, 72, 157, 1),
    };
    return MaterialApp(
      title: 'Munni Bomb',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFE9A6A6, color),
      ),
      home: const HomePage(),
    );
  }
}
