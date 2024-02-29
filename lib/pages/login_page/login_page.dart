import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vector_math/vector_math_64.dart';

import '../../controllers/home_screen_controller/dataBaseController.dart';
import '../../gen/assets.gen.dart';
import '../../widgets/bottom_sheet_login_widget.dart';
import 'animation_controller.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    //******* Initialling Controllers ************************************
    final myAnimationController = Get.put(MyAnimationController());
    myAnimationController.startButtonAnimation();

    //****** Hive Box Initialization *******************************************
    final myDataBase = Hive.box("UserDataBox");
    //********** Initialization Home Controller ********************************
    final myDataBaseController = Get.put(DataBaseController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 19, 44),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /////************* Welcome Image *********************************
              Image.asset(
                Assets.icons.welcome.path,
                height: Adaptive.h(40),
              ),
              SizedBox(height: Adaptive.h(10)),
              /////************** Log In / Divider / Sign Up *******************
              Column(
                children: [
                  //************************************************ Log In Button ***
                  Obx(() {
                    return AnimatedContainer(
                        transform: Matrix4.translation(Vector3(
                            myAnimationController.xTranslation.value, 0, 10)),
                        duration: const Duration(seconds: 2),
                        child: ElevatedButton(
                          ///******************** Function For Log In Button ********************************
                          onPressed: () {
                            if (myDataBase.isNotEmpty) {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                scrollControlDisabledMaxHeightRatio:
                                    BorderSide.strokeAlignCenter,
                                context: context,
                                builder: (context) {
                                  //******* User Don't Log In Have Sign Up ****************
                                  return BottomSheetWidgetLogIn(
                                      txtForButton: "Log In",
                                      myDataBaseController:
                                          myDataBaseController,
                                    myCallback: () {
                                      myDataBaseController.addNewUser();
                                    },);
                                },
                              );
                              //   } else if (myDataBaseController
                              //       .dataBaseHive.isNotEmpty) {
                              //     showModalBottomSheet(
                              //       isScrollControlled: true,
                              //       scrollControlDisabledMaxHeightRatio:
                              //           BorderSide.strokeAlignCenter,
                              //       context: context,
                              //       builder: (context) {
                              //         //******* User Don't Log In Have Sign Up ****************
                              //         return BottomSheetWidgetLogIn(
                              //           txtForButton: 'Log In',
                              //           myDataBaseController: myDataBaseController,
                              //         );
                              //       },
                              //     );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Log In",
                              style: MyTextStyles.large_2,
                            ),
                          ),
                        ));
                  }),
                  //*** Divider Animation ***
                  Obx(() {
                    return Divider(
                      thickness: 5,
                      color: Color.fromARGB(
                          myAnimationController.aColorDivider.value, 52, 4, 4),
                      indent: 20,
                      endIndent: 20,
                    );
                  }),
                  //***************************************************************** Sign Up Button ***
                  Obx(() {
                    return AnimatedContainer(
                        transform: Matrix4.translation(Vector3(
                            0, myAnimationController.yTranslation.value, 0)),
                        duration: const Duration(seconds: 2),
                        child: ElevatedButton(
                          ///******************** Function For Sign Up Button ********************************
                          onPressed: () {
                            myDataBaseController.loadOldData();
                            //myDataBaseController.deleteDataBase();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "About Us",
                              style: MyTextStyles.large_2,
                            ),
                          ),
                        ));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
