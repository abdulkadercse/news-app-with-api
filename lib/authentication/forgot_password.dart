import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'otp_verify.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              decoration: const InputDecoration(
                hintText: "Enter your email",
                fillColor: Colors.white,
                filled: true,
                labelText: "Email address",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),
            ElevatedButton(onPressed: (){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Send",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                ).onTap(()=>const OtpVerify().launch(context)),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
