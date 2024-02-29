import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:git_project/controllers/home_screen_controller/dataBaseController.dart';
import 'package:git_project/widgets/textField.dart';
import '../my_textStyles_Colors/MytextStyles.dart';

class BottomSheetWidgetLogIn extends StatelessWidget {
  String txtForButton;
  final DataBaseController myDataBaseController;
  final Callback? myCallback;


  BottomSheetWidgetLogIn(
      {super.key,
      required this.txtForButton,
      required this.myDataBaseController,
      this.myCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: Adaptive.h(50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(0, 80, 80, 80),
            border: Border.all(
                color: const Color.fromARGB(255, 86, 33, 33),
                width: 10,
                style: BorderStyle.solid)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //*** User Name Text Editing ***
              MyTextField(
                myLabelText: 'Name',
                myHintText: 'Enter your name',
                myPrefixIcon: Icons.email,
                myTextFieldController: myDataBaseController.newUserNameTextEditingController,
                myVerticalPadding: 12.dp,
                myHorizontalPadding: 12.dp,
              ),
              SizedBox(height: 5.dp),
              //*** User Email Text Editing ***
              MyTextField(
                myLabelText: 'Email',
                myHintText: 'amir@gmail.com',
                myPrefixIcon: Icons.email,
                myTextFieldController: myDataBaseController.newUserEmailTextEditingController,
                myVerticalPadding: 12.dp,
                myHorizontalPadding: 12.dp,
              ),
              SizedBox(height: 5.dp),
              //*** User Password Text Editing ***
              MyTextField(
                myLabelText: 'Password',
                myHintText: '*****',
                myTextFieldController: myDataBaseController.newUserPasswordTextEditingController,
                myVerticalPadding: 12.dp,
                myHorizontalPadding: 12.dp,
                myPrefixIcon: Icons.password,
              ),
              ElevatedButton(
                  onPressed: myCallback,
                  child: Text(
                    txtForButton,
                    style: MyTextStyles.medium_1,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
