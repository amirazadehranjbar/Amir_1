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
      for (int i = 0; i < dataBaseHive.length; i++) {
        print(dataBaseHive.getAt(i));
      }
      print("Data Base Not Empty ------>${dataBaseHive.get("UserDataBox")}");
    }
  }

  //*** Show Data To Users **
  void receiveData() {
    // dataList.addAll(dataBaseHive.get("UserDataBox"));
    print(dataBaseHive.get("UserDataBox"));
  }

  //*** Recode User Data ********
  void saveDataToDataBase() {
    dataBaseHive.put("UserDataBox", dataList);
    print("From Detect The Change ------> ${dataBaseHive.get("UserDataBox")}");
  }

  //********* Function For Add New Task ********************************
  void addNewUser(BuildContext context) {
    // Use the newTaskTextEditingController to get the values
    var newTask = {
      "userName": newUserNameTextEditingController.text,
      "usrEmail": newUserEmailTextEditingController.text,
      "password": newUserPasswordTextEditingController.text,
    };

    // Add the new task to dataList
    dataList.add(newTask);
    print(dataList);

    // Save the updated dataList to the database
    saveDataToDataBase();

    // Optionally, you can clear the text field
    newUserNameTextEditingController.clear();
  }
}
