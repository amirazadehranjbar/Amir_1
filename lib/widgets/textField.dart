
import 'package:flutter/material.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';

class MyTextField extends StatelessWidget {
  final String myLabelText;
  final String myHintText;
  final IconData? myPrefixIcon;
  final IconData? myIcon;
  final double? myIconSize;
  final Color? myIconColor;
  final TextEditingController myTextFieldController;
  final double myVerticalPadding;
  final double myHorizontalPadding;


  const MyTextField(
      {super.key,
      required this.myLabelText,
      required this.myHintText,
      this.myPrefixIcon,
      this.myIcon,
      this.myIconSize,
      this.myIconColor,
      required this.myTextFieldController,
      required this.myVerticalPadding,
      required this.myHorizontalPadding,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: myVerticalPadding, horizontal: myHorizontalPadding),
      child: TextField(
        cursorColor: const Color.fromARGB(255, 220, 187, 22),
        controller: myTextFieldController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 15, 159, 143), width: 5),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 5, color: Color.fromARGB(80, 80, 80, 80))),
          labelText: myLabelText,
          hintText: myHintText,
          hoverColor: const Color.fromARGB(255, 234, 190, 11),
          filled: true,
          hintStyle: MyTextStyles.medium_1,
          labelStyle: MyTextStyles.medium_0,
          focusColor: const Color.fromARGB(255, 99, 178, 187),
          fillColor: const Color.fromARGB(255, 23, 51, 68),
          prefixIcon: Icon(
            myPrefixIcon,
            size: myIconSize,
          ),
          iconColor: myIconColor,
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 8, 72, 79), width: 4),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
