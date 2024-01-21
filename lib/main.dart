// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:git_project/gen/assets.gen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Dubia",
      textTheme: TextTheme(
        bodySmall: TextStyle(color: Colors.white , fontFamily: "Dubia",fontSize: 12,fontWeight: FontWeight.w100),
        bodyMedium: TextStyle(color: Colors.white , fontFamily: "Dubia",fontSize: 14,fontWeight: FontWeight.w200),
        displaySmall: TextStyle(color: Colors.white , fontFamily: "Dubia",fontSize: 116,fontWeight: FontWeight.w300),
        displayLarge: TextStyle(color: Colors.white , fontFamily: "Dubia",fontSize: 18,fontWeight: FontWeight.w400),
      ),brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.white12,
      body: Center(
        child: Image.asset(Assets.images.logo.path),
      )),
    );
  }
}


