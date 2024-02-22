// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_project/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/my_textStyles_Colors/my_colors.dart';
import 'package:git_project/pages/profile_page/profile_screen.dart';
import 'home_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        ///******************** App Bar *********************************************///
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: () {}, child: Icon(Icons.menu)),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:
                    Image.asset(Assets.images.logo.path, width: 50, height: 50),
              ),
              Icon(Icons.search),
            ],
          ),
        ),
        body: Stack(children: [
          ///******************** Home Screen *********************************************///
          HomeScreen(),

          ///******************** Bottom Navigation  *********************************************///
          Positioned(
            bottom: 10,
            right: size.width / 7,
            left: size.width / 7,
            child: Container(
                height: size.height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: MyListColors.blogsCoverGradient,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
                child: Container(
                  height: size.height / 12,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: MyListColors.posterCoverGradient,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      borderRadius: BorderRadius.circular(15)),
                  //////// Add Row to Icons for bottom navigation
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ///***************** Home Button *************///
                      IconButton(
                          onPressed: () {},
                          icon: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(Assets.icons.home.path))),

                      ///**************** User Button *************///
                      IconButton(
                          onPressed: () {
                            Get.to(ProfileScreen(),
                                transition: Transition.fadeIn,
                                duration: Duration(seconds: 2));
                          },
                          icon: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(Assets.icons.user.path))),

                      ///**************** Pencil Button *************///
                      IconButton(
                          onPressed: () {},
                          icon: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                Assets.icons.pencil.path,
                                scale: 1.5,
                              ))),
                    ],
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
