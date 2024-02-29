import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataBaseController extends GetxController {
  //****** Hive Box Initialization *****************************************************
  final dataBaseHive = Hive.box("UserDataBox");

  //********* Create List For Tasks ***************************************
  RxList<Map<String, dynamic>> dataList = RxList<Map<String, dynamic>>([]);

  //******* New User Text Field Controller ***********************************
  final TextEditingController newUserNameTextEditingController =
      TextEditingController();

  final TextEditingController newUserEmailTextEditingController =
      TextEditingController();

  final TextEditingController newUserPasswordTextEditingController =
      TextEditingController();

  //********* Create Data Base Functions **************************************
  //*************************************************************************

  //*** Show Default Data To Users ***
  //*** Show Default Data To Users ***
  void loadOldData() {
    if (dataBaseHive.isEmpty) {
      Get.snackbar("Welcome to My Application", "Please Sign Up",
          colorText: const Color.fromARGB(157, 43, 180, 130));
      print("Data Base Is Empty ------>${dataBaseHive.values}");
    } else {
      // for (int i = 0; i < dataBaseHive.length; i++) {
      //   print(dataBaseHive.getAt(i));
      // }
      print("Data Base Not Empty ------>${dataBaseHive.get("UserDataBox")}");
    }
  }

  //*** Show Data To Users **
  void receiveData() {
    // dataList.addAll(dataBaseHive.get("UserDataBox"));
    print(dataBaseHive.get("UserDataBox"));
  }


  //********* Function For Add New Task ********************************
  void addNewUser() {
    // Use the newTaskTextEditingController to get the values
    var newUserName = newUserNameTextEditingController.text;
    var newUserEmail = newUserEmailTextEditingController.text;

    // Retrieve the existing data from the database and cast it to the correct type
    List<Map<String, dynamic>> existingData =
        (dataBaseHive.get("UserDataBox") as List<dynamic>?)
            ?.map((item) => Map<String, dynamic>.from(item))
            ?.toList() ?? [];

    // Check if user with the same userName or newUserEmail already exists
    bool userExists = existingData.any((user) =>
    user['userName'] == newUserName || user['usrEmail'] == newUserEmail);

    if (userExists) {
      // Display a message or take any appropriate action
      Get.snackbar("User Already Exists", "Please choose a different username or email");
    } else {
      // Add the new user to the existing data
      var newUser = {
        "userName": newUserName,
        "usrEmail": newUserEmail,
        "password": newUserPasswordTextEditingController.text,
      };

      existingData.add(newUser);

      // Update the dataList with the modified data
      dataList.assignAll(existingData);
      dataList.refresh();

      // Save the updated dataList to the database
      dataBaseHive.put("UserDataBox", existingData);
      print(dataBaseHive.get("UserDataBox"));

      // Optionally, you can clear the text field
      newUserNameTextEditingController.clear();
      newUserPasswordTextEditingController.clear();
      newUserEmailTextEditingController.clear();
    }
  }



}
