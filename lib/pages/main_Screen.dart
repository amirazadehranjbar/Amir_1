// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/pages/splash_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //////// Top Row ///////////////////////////////////////////////////
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () {}, child: Icon(Icons.menu)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(Assets.images.logo.path,
                        width: 50, height: 50),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: Image.asset(Assets.images.conf.path).image),
                  ),
                  height: size.height / 5,
                  width: size.width / 1.5,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
