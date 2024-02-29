import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LogInController extends GetxController{
  //******** Log In Button Function **********************************************
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var userName = "".obs;
  var userPassword = "".obs;
  void logInFunction() {

  }




  ////************** Animation Functions ***************************************
  RxDouble xTranslation = RxDouble(-1000);
  RxDouble yTranslation = RxDouble(-1000);
  RxInt aColorDivider = RxInt(0);

  Future<void> startButtonAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    xTranslation.value = 0;
    yTranslation.value = 0;
    aColorDivider.value = 255;

  }

  ///************* Text Controller *********************************************



}