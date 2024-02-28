import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';
import 'package:git_project/pages/register_page/register_page_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:validators/validators.dart';

import '../my_categories_page/my_categories_page.dart';

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
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: SizedBox(
                height: 280,
                child: Center(
                    child: Text(
                  "Page $index",
                  style: const TextStyle(color: Colors.indigo),
                )),
              ),
            ));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
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
                    registercontroller.pageIndex.value = value;
                  },
                  itemCount: pages.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 12),
                child: Obx(() {
                  return Text(
                    registercontroller.pageIndex.value.toString(),
                    style: const TextStyle(color: Colors.black54),
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
                  buildShowModalBottomSheetEmail(context, size);
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

  ///****************** Email Bottom Sheet ************************************************
  Future<dynamic> buildShowModalBottomSheetEmail(
      BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade400,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white38, width: 3)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //*** Email Text ******
                Text(
                  "Please Enter Your Email Address",
                  style: MyTextStyles.mediumDark_4,
                ),
                //*** Text Field Input Email ****
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: registercontroller.emailController,
                    onChanged: (value) {
                      print(
                          "************************************** ${isEmail(value)}");
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        labelText: "Email Address",
                        hintText: "youremail@gmail.com"),
                  ),
                ),
                //*** Button for Next *********
                ElevatedButton(
                    onPressed: () {
                      registercontroller.email.value =
                          registercontroller.emailController.text;
                      Get.back();
                      buildShowModalBottomSheetActivateCode(context, size);
                    },
                    child: Text("Next", style: MyTextStyles.medium_1))
              ],
            )),
          ),
        );
      },
    );
  }

  ///****************** Activate Code Bottom Sheet ************************************************
  Future<dynamic> buildShowModalBottomSheetActivateCode(
      BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.teal.shade400,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orangeAccent, width: 3)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //*** Email Text ******
                Text(
                  "${registercontroller.email.value}  Your Activate Code",
                  style: MyTextStyles.mediumDark_4,
                ),
                //*** Text Field Input Email ****
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        labelText: "Activate Code", hintText: "********"),
                  ),
                ),
                //*** Button for Next *********
                ElevatedButton(
                    onPressed: () {
                      Get.to(()=>MyCategoriesPage(),transition: Transition.fadeIn,duration: const Duration(seconds: 2));
                    },
                    child: Text("Active", style: MyTextStyles.medium_1))
              ],
            )),
          ),
        );
      },
    );
  }
}
