import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';
import 'package:git_project/pages/my_categories_page/categories_list.dart';
import 'package:git_project/pages/my_categories_page/categories_model.dart';
import 'package:git_project/pages/my_categories_page/category_controller.dart';

///*******************************************************

class MyCategoriesPage extends StatelessWidget {
  MyCategoriesPage({super.key});

  final controller = Get.put(CategoryController());

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
          child: Obx(() {
            return Center(
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
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: Adaptive.h(35),
                    width: Adaptive.w(90),
                    transform: Matrix4.rotationZ(controller.zRotation.value),
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: categoryList.length,
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
                            height: Adaptive.h(0.3),
                            //******* Image for Category *******
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.white38, width: 3),
                                image: DecorationImage(
                                    image: AssetImage(
                                        categoryList[index].catImage),
                                    fit: BoxFit.cover)),
                            padding: const EdgeInsets.all(5),
                            child: Stack(
                              children: [
                                //*** See More Button ***
                                Positioned(
                                    bottom: 5,
                                    left: 5,
                                    right: 5,
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.zRotation.update((val) {
                                          if (val == 0) {
                                            controller.zRotation.value = 0.5;
                                          } else if (val == 0.5) {
                                            controller.zRotation.value = 0;
                                          }
                                          controller.userCategory.add(
                                              CategoryModel(
                                                  catId: categoryList[index].catId,
                                                  catName: categoryList[index]
                                                      .catName,
                                                  catImage: categoryList[index]
                                                      .catImage));
                                          categoryList.removeAt(index);
                                        });
                                      },
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
                  ),
                  const Divider(
                      color: Colors.blue,
                      thickness: 5,
                      endIndent: 10,
                      indent: 10),
                  //*********** Selected Category From User **********************
                  SizedBox(
                      height: Adaptive.h(35),
                      width: Adaptive.w(90),
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: controller.userCategory.length,
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
                              height: Adaptive.h(0.3),
                              //******* Image for Category *******
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white38, width: 3),
                                  image: DecorationImage(
                                      image: AssetImage(controller.userCategory[
                                              index]
                                          .catImage),
                                      fit: BoxFit.cover)),
                              padding: const EdgeInsets.all(5),
                              child: Stack(
                                children: [
                                  //*** See More Button ***
                                  Positioned(
                                      bottom: 5,
                                      left: 5,
                                      right: 5,
                                      height: 30,
                                      child: ElevatedButton(
                                        onPressed: () {print(controller.userCategory[index].catId);},
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        controller.userCategory[index]
                                            .catName,
                                        style: MyTextStyles.small_0,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ));
                        },
                      ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
