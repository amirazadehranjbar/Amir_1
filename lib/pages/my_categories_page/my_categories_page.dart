import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';
import 'package:git_project/pages/my_categories_page/categories_list.dart';

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
                SizedBox(
                  height: Adaptive.h(30),
                  width: Adaptive.w(90),
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: Adaptive.w(2),
                        mainAxisSpacing: Adaptive.h(2),
                        crossAxisCount: 2,
                        childAspectRatio: 0.9),
                    itemBuilder: (context, index) {
                      return Container(
                          width: Adaptive.w(0.2),
                          height: Adaptive.h(0.2),
                          //******* Image for Category *******
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.white38, width: 3),
                              image: DecorationImage(
                                  image:
                                      AssetImage(categoryList[index].catImage),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              //*** See More Button ***
                              Positioned(
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: () {print(categoryList[index].catId);},
                                    child: const Text(
                                      "See More",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                              //*** Category Name ***
                              Positioned(
                                top: 5,
                                right: 5,
                                left: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      border: Border.all(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    categoryList[index].catName,
                                    style: MyTextStyles.small_0,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
