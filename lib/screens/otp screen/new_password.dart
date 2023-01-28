import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Password"),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            // new password
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: newPasswordController,
              decoration: const InputDecoration(
                  hintText: "Enter your Password",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "New Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),
            // confirm password
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                  hintText: "Confirm Password",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),
            ElevatedButton(onPressed: (){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Submit",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                ),
              ],
            )),

          ],
        ),
      ),
    );
  }
}
