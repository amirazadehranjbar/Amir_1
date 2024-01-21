// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:git_project/pages/main_Screen.dart';
import '../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.off(MainScreen(context));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(Assets.images.logo.path,
                    height: 200, width: 200)),
            SizedBox(
              height: 20,
            ),
            SpinKitWaveSpinner(
              color: Colors.orangeAccent,
              waveColor: Colors.blueAccent,
              trackColor: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
