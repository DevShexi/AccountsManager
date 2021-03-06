import 'package:flutter/material.dart';
import 'package:myShop/PRESENTATION/Routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter _approuter = AppRouter();
  final primary = Colors.blueGrey[800];

  final secondary = Colors.blueGrey[700];

  final txtColor = Colors.white;

  final bg = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _approuter.onGenerateRoute,
      theme: ThemeData.from(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primary,
            primaryVariant: primary,
            secondary: secondary,
            secondaryVariant: secondary,
            background: bg,
            surface: bg,
            onBackground: txtColor,
            onSurface: txtColor,
            onError: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            error: Colors.red.shade400),
      ).copyWith(
          buttonColor: primary,
          cursorColor: primary,
          highlightColor: secondary,
          toggleableActiveColor: primary),
    );
  }
}
