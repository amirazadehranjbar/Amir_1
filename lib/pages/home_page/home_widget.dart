

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../models/fake_data.dart';
import '../../my_textStyles_Colors/my_colors.dart';
import '../../my_textStyles_Colors/MytextStyles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///**************************** 1 *******************************************************////
          home_first_stack(),
          ///**************************** 2 *******************************************************////
          home_second_title_hashtag(),
          ///**************************** 3 *******************************************************////
          home_third_title_blogs(),
          ///**************************** 4 *******************************************************////
          SizedBox(
            height: size.height*0.3,
            width: size.width*0.8,
            child: ListView.builder(
              itemCount: blogList.length,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: Stack(
                        // fit: StackFit.loose,
                        children: [
                          //// Add Image List View for Hottest Blogs
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              foregroundDecoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors:
                                      MyListColors.blogsCoverGradient,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius:
                                  BorderRadius.circular(15)),
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: Colors.blueGrey,
                                        width: 5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(blogList[index]
                                      .writerImageUrl
                                      .toString()),
                                ),
                              ),
                            ),
                          ),
                          //// Add Writer Name And Like
                          Positioned(
                              bottom: 20,
                              left: 15,
                              right: 15,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  /// Add Writer Name
                                  Text(
                                    blogList[index].writer.toString(),
                                    style: MyTextStyles.small_1,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),

                                  /// Add Like Icon
                                  const Icon(Icons.heart_broken_outlined,
                                      size: 10),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(blogList[index].views.toString(),
                                      style:MyTextStyles.small_1),
                                ],
                              )),
                        ],
                      ),
                    ),
                    //// Add Text for Summary of blogs
                    SizedBox(
                        width: size.width / 3.5,
                        child: Text(
                          blogList[index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: MyTextStyles.small_1,
                        )),
                  ],
                );
              },
            ),
          ),
          ///**************************** 5 ******************************************************/////
          Container(
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Seeing Hottest Podcasts",
                      style: MyTextStyles.medium_3),
                  const Icon(Icons.mic)
                ],
              ),
            ),
          ),
          ///*************************** 6   *******************************************************///
          SizedBox(
            height: size.height / 4.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  width: 5, color: Colors.blueGrey)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Flexible(
                              flex: 2,
                              child: Flexible(
                                flex: 2,
                                child: Stack(
                                  children: [
                                    Expanded(
                                      child: Image.network(blogList[index]
                                          .writerImageUrl
                                          .toString(),fit: BoxFit.fill),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: size.width / 10,
                                      right: size.width / 10,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.blueGrey,
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 3),
                                          ),
                                          child: Center(
                                              child: Text(
                                                "Podcast ${index + 1}",
                                                style: MyTextStyles.medium_2,
                                              ))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: blogList.length,
                  ),
                ),
              ]),
            ),
          ),
          ///*************************** 7 *******************************************************///
          SizedBox(height: size.height/10,)

        ],
      ),
    );
  }
}


///************************** 1 ******************************************************///
class home_first_stack extends StatelessWidget {
  const home_first_stack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Flexible(
        flex: 2,
        child: Stack(children: [
          ///// Add Image and Gradient Color
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(homePagePosterMap["imageUrl"])),
            ),
            height:size.height / 3,
            width: size.width / 1.5,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
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
                      style: MyTextStyles.medium_1,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.remove_red_eye_rounded,
                            color:
                            Color.fromARGB(100, 255, 255, 255)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${homePagePosterMap["view"]}",
                          style: MyTextStyles.medium_2,
                        ),
                      ],
                    ), ///// Add Expandable Text
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ExpandableText(
                  homePagePosterMap["title"],
                  expandText: "Show more",
                  collapseText: "Show Less",
                  style: MyTextStyles.small_2,
                  animation: true,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

///************************** 2 *****************************************************///
class home_second_title_hashtag extends StatelessWidget {
  const home_second_title_hashtag({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
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
                  gradient: const LinearGradient(
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
                        style: MyTextStyles.small_3),
                    const SizedBox(
                      width: 5,
                    ),
                    const ImageIcon(
                        AssetImage("assets/images/hashtag.png"),
                        size: 20),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: tagsList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        // padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      ),
    );
  }
}

////************************ 3 *****************************************************////
class home_third_title_blogs extends StatelessWidget {
  const home_third_title_blogs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Seeing Hottest Blogs",
                style: MyTextStyles.medium_3),
            const Icon(Icons.menu_book)
          ],
        ),
      ),
    );
  }
}
