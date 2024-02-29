import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';
import 'package:git_project/pages/login_page/login_controller.dart';
import 'package:git_project/widgets/textField.dart';
import 'package:vector_math/vector_math_64.dart';

import '../../gen/assets.gen.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    controller.startButtonAnimation();

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
                  //*** Log In Button ***
                  Obx(() {
                    return AnimatedContainer(
                        transform: Matrix4.translation(
                            Vector3(controller.xTranslation.value, 0, 10)),
                        duration: const Duration(seconds: 2),
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              scrollControlDisabledMaxHeightRatio:
                                  BorderSide.strokeAlignCenter,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Container(
                                    height: Adaptive.h(40),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            const Color.fromARGB(0, 80, 80, 80),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 86, 33, 33),
                                            width: 10,
                                            style: BorderStyle.solid)),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //*** Use Name Text Editing ***
                                          MyTextField(
                                            myLabelText: 'Email',
                                            myHintText: 'amir@gmail.com',
                                            myPrefixIcon: Icons.email,
                                            myTextFieldController:
                                                controller.userNameController,
                                            myVerticalPadding: 12.dp,
                                            myHorizontalPadding: 12.dp,
                                          ),
                                          SizedBox(height: 5.dp),
                                          //*** Check User Name and Password ***
                                          MyTextField(
                                            myLabelText: 'Password',
                                            myHintText: '*****',
                                            myTextFieldController:
                                                controller.passwordController,
                                            myVerticalPadding: 12.dp,
                                            myHorizontalPadding: 12.dp,
                                            myPrefixIcon: Icons.password,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                controller.userName.value =
                                                    controller
                                                        .userNameController
                                                        .text;
                                                controller.userPassword.value =
                                                    controller
                                                        .passwordController
                                                        .text;
                                                print(
                                                    "User Name === ${controller.userName.value}");
                                                print(
                                                    "User Password === ${controller.userPassword.value}");
                                              },
                                              child: Text(
                                                "Log In",
                                                style: MyTextStyles.medium_1,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
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
                          controller.aColorDivider.value, 52, 4, 4),
                      indent: 20,
                      endIndent: 20,
                    );
                  }),
                  //*** Sign Up Button ***
                  Obx(() {
                    return AnimatedContainer(
                        transform: Matrix4.translation(
                            Vector3(0, controller.yTranslation.value, 0)),
                        duration: const Duration(seconds: 2),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Sign Up",
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
