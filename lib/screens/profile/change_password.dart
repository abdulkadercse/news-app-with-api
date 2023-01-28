import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/screens/bottom%20navigration/bottom_navigation.dart';

import '../../repository/auth_repo.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First Name
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              controller: currentPasswordController,
              decoration: const InputDecoration(
                  hintText: "Enter your Current Password",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Current Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),

            // password
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: newPasswordController,
              decoration: const InputDecoration(
                  hintText: "Enter your New Password",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: " New Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                  hintText: "Enter your Confirm Password",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),


            // sign in button
            ElevatedButton(onPressed: () async{
              EasyLoading.show(status: "Updating Password");
              var result = await AuthRepo().changePasswordRepo(
                  currentPasswordController.text,
                  newPasswordController.text,
                  confirmPasswordController.text);

              if(result){
                EasyLoading.showSuccess("Password Update Successful");
                BottomNav().launch(context);
              }else{
                EasyLoading.showError("Failed");
              }



            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Change Password",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
