import 'package:flutter/material.dart';
import 'package:git_project/gen/assets.gen.dart';
import 'package:git_project/my_textStyles_Colors/MytextStyles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile Screen",
            style: MyTextStyles.large_3,
          ),
          centerTitle: true,
          shape: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.white38),
              borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ///******************** Image for profile ***************************************///
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 30),
              child: Image.asset(
                Assets.icons.profile.path,
                width: size.width * 0.4,
              ),
            ),

            ///******************** Button for edite profile picture ***************************************///
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Edite profile picture",
                  style: MyTextStyles.medium_2,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Assets.icons.editeProfile.path,
                      width: 40,
                    ))
              ],
            ),
               const Divider(color:Colors.cyan,thickness: 3,indent: 30,endIndent: 30),

                ///******************  User Name ****************************************************////
                 Text("User name", style: MyTextStyles.medium_2),
                ///ToDo: Hard code for user name
                const SizedBox(height: 20,),
                ///******************  User Email ****************************************************////
                Text("User Email@gmail.com", style: MyTextStyles.medium_2),
                ///ToDo: Hard code for user email
                const Divider(color:Colors.cyan,thickness: 3,indent: 30,endIndent: 30),
                const SizedBox(height: 15,),
                ///****************** Favorites Articles ****************************************************////
                ElevatedButton(onPressed: (){},
                style: const ButtonStyle(side: MaterialStatePropertyAll(BorderSide(color: Colors.white))),
                    child: Text("Favorites Articles", style: MyTextStyles.medium_4),),
                const SizedBox(height: 15,),
                ///****************** Favorites Articles ****************************************************////
                ElevatedButton(onPressed: (){},
                  style: const ButtonStyle(side: MaterialStatePropertyAll(BorderSide(color: Colors.white))),
                  child: Text("Favorites Podcast", style: MyTextStyles.medium_4),),
                const SizedBox(height: 15,),
                ///****************** Favorites Articles ****************************************************////
                ElevatedButton(onPressed: (){},
                  style: const ButtonStyle(side: MaterialStatePropertyAll(BorderSide(color: Colors.white))),
                  child: Text("Log Out", style: MyTextStyles.medium_4),),
                const SizedBox(height: 15,),
          ]),
        ),
      ),
    );
  }
}
