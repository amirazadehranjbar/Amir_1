// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/pages/splash_page/splash_screen.dart';
import 'my_textStyles_Colors/MytextStyles.dart';

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
    return FlutterSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(
                    width: 3,
                    color: Colors.white38,
                  )),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  elevation: MaterialStatePropertyAll(20),
                  backgroundColor: MaterialStatePropertyAll(Colors.black45),
                )),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 8),
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                hoverColor: Colors.teal),
            brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    },);
  }
}
