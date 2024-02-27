import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';

///*******************************************************

class MyCategoriesPage extends StatelessWidget {
  const MyCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    ////********* My Strings ********************************
    var successfulMessage =
        "Welcome .... \n Please enter your name and last name";
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///************* Logo Image ************************************
                SizedBox(height: Adaptive.h(2)),
                Image.asset(
                  Assets.images.youtube.path,
                  height: Adaptive.h(20),
                ),

                ///************* Text For successfulMessage ********************
                Text(
                  successfulMessage,
                  style: MyTextStyles.large_4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Adaptive.h(2)),
                //************* Name And Last Name Input ***********************
                Padding(
                  padding: EdgeInsets.all(14.dp),
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: "Name and Last Name",
                        labelText: "Enter Information"),
                  ),
                ),
                //************* Text Favorites Categories **********************
                Text(
                  "Choose your favorite categories",
                  style: MyTextStyles.medium_1,
                ),
                SizedBox(height: Adaptive.h(2)),
                //*********** Favorites Categories Grid View Builder ***********
                GridView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: 15,
                  shrinkWrap: true,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing:Adaptive.w(2) ,
                      mainAxisSpacing: Adaptive.h(2),
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Container(
                        width: Adaptive.w(10),
                        height: Adaptive.h(10),
                        color: Colors.white12,
                        child: Text("Grid View", style: MyTextStyles.medium_1));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
