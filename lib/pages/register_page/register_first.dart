import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';
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
    var size = MediaQuery.of(context).size;

    /// Create List For Smooth Page Indicator *****************************************
    final pages = List.generate(
        6,
        (index) => Container(
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///************ Image for welcome message *********************************************
              SizedBox(height: size.height * 0.1),
              Image.asset(Assets.icons.welcome.path, height: size.height * 0.2),
              SizedBox(height: size.height * 0.05),

              ///************* Add  Smooth Page Indicator   ******************************************
              SizedBox(
                height: size.height * 0.2,
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
              SizedBox(height: size.height * 0.1),

              ///************* Lets Go Button *********************************************************
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white38,width: 3)),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return MyTextStyles.large_4;
                  }
                  return MyTextStyles.medium_1;
                })),
                child: const Text(
                  "Lets Go",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
