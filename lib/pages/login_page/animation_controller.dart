import 'package:get/get.dart';

class MyAnimationController extends GetxController{



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