import 'package:catalogo_simples/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_simples/screens/home_screen/home_screen.dart';

class CatalogoSimplesApp extends StatelessWidget {
  const CatalogoSimplesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Catalogo simples",
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF2EC4B6),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFFF7F7FF),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          headline2: TextStyle(
            color: Color(0xFFF7F7FF),
            fontWeight: FontWeight.w400,
            fontSize: 14
          ),
          headline3: TextStyle(
            color: Color(0xFFF7F7FF),
            fontWeight: FontWeight.w400,
            fontSize: 24
          ),
          button: TextStyle(
            color: Color(0xFFFDFFFC),
            fontWeight: FontWeight.w500,
            fontSize: 24
          )
        )
      ),
    );
  }
}