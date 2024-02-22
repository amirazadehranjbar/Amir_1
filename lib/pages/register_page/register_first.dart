import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/pages/register_page_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterPageFirst extends StatelessWidget {
  RegisterPageFirst({super.key});

  ////************** Controller For Smooth Page Indicator *****************************
  final pagecontroller = PageController(viewportFraction: 0.8, keepPage: true);

  ///*************** Register Controller Initialize ************************
  final registercontroller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    /// Create List For Smooth Page Indicator *****************************************
    final pages = List.generate(
        6,
            (index) =>
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.teal.shade600,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                height: 280,
                child: Center(
                    child: Text(
                      "Page $index",
                      style: TextStyle(color: Colors.indigo),
                    )),
              ),
            ));

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ///************ Image for welcome message *********************************************
              Image.asset(Assets.icons.welcome.path, height: size.height * 0.2),
              SizedBox(height: 10),

              ///************* Add  Smooth Page Indicator   ******************************************
              SizedBox(
                height: 240,
                child: PageView.builder(
                  controller: pagecontroller,
                  onPageChanged: (value) {
                    registercontroller.PageIndex.value = value;
                  },
                  itemCount: pages.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
               Padding(
                padding: EdgeInsets.only(top: 24, bottom: 12),
                child: Obx(() {
                  return Text(
                  registercontroller.PageIndex.value.toString(),
                  style: TextStyle(color: Colors.black54),
                  );
                }),
              ),
              SmoothPageIndicator(
                controller: pagecontroller,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thinUnderground,
                  dotColor: Colors.white38,
                  activeDotColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
