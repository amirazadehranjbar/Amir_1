import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var pageIndex = 0.obs;

  TextEditingController emailController = TextEditingController();
  var email = "".obs;
}
