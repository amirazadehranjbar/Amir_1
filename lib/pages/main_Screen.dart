// ignore_for_file: prefer_const_constructors
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/models/data_models.dart';
import 'package:git_project/my_colors.dart';
import 'package:git_project/pages/splash_screen.dart';
import 'package:git_project/text_styles.dart';

import '../models/fake_data.dart';

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

            ////// Add Stack for Image and Gradient Color and Text
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Stack(children: [
                ///// Add Image and Gradient Color
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(homePagePosterMap["imageUrl"])),
                  ),
                  height: size.height / 5,
                  width: size.width / 1.5,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        colors: MyListColors.posterCoverGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                ),

                Positioned(
                  bottom: 5,
                  left: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            homePagePosterMap["writer"],
                            style: myTextStyles.mediumLight_2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.remove_red_eye_rounded,
                                  color: Color.fromARGB(100, 255, 255, 255)),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${homePagePosterMap["view"]}",
                                style: myTextStyles.mediumLight_2,
                              ),
                            ],
                          ), ///// Add Expandable Text
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ExpandableText(
                        homePagePosterMap["title"],
                        expandText: "Show more",
                        collapseText: "Show Less",
                        style: myTextStyles.smallLight,
                        animation: true,
                      )
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 15,
            ),

            ///// Add List View for Hash Tags
            SizedBox(
              height: 60,
              width: (size.width) - 5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: MyListColors.tagsCoverGradient,
                              end: Alignment.centerLeft,
                              begin: Alignment.centerRight)),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(tagsList[index].title,
                                style: myTextStyles.mediumLight_2),
                            SizedBox(
                              width: 5,
                            ),
                            ImageIcon(AssetImage("assets/images/hashtag.png"),
                                size: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: tagsList.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal),
                // padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              ),
            ),

            //// Add Title and Icon For Viewing Hottest Blogs
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Seeing Hottest Blogs",
                    style: myTextStyles.mediumLight_2,
                  ),
                  SizedBox(width: 15),
                  Icon(Icons.pending_actions_sharp),
                ],
              ),
            ),

            //// Add List View for Hottest Blogs
            SizedBox(
              height: size.height / 6.5,
              child: ListView.builder(
                itemCount: blogList.length,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    fit: StackFit.loose,
                    children: [
                      //// Add Image List View for Hottest Blogs
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.blueGrey, width: 5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                                blogList[index].imageUrl.toString()),
                          ),
                        ),
                      ),
                      //// Add Writer Name and Date
                      Positioned(
                          bottom: 20,
                          left: 30,
                          child: Text(
                            blogList[index].writer.toString(),
                            style: myTextStyles.smallLight,
                          )),
                      //// Add Gradiant Color
                      // Container(
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //           colors: MyListColors.tagsCoverGradient,
                      //           begin: Alignment.topCenter,
                      //           end: Alignment.bottomCenter),
                      //       borderRadius: BorderRadius.circular(15)),
                      //   width: 50,
                      // ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
