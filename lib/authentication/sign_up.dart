import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/authentication/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First Name
            AppTextField(
              textFieldType: TextFieldType.NAME,
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: "Enter your first name",
                filled: true,
                fillColor: Colors.white,
                labelText: "First Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),
            // last name
            AppTextField(
              textFieldType: TextFieldType.NAME,
              controller: lastNameController,
              decoration: const InputDecoration(
                  hintText: "Enter your Last name",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Last Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),
            // Email address
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: "Enter your Email address",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),
            // phone
            AppTextField(
              textFieldType: TextFieldType.PHONE,
              controller: phoneController,
              decoration: const InputDecoration(
                  hintText: "Enter your Phone Number",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10.0,),
            // password
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: "Enter your Password",
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Password",
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
                  hintText: "Enter your Confirm Password",
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
              children: const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Sign Up",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                ),
              ],
            )),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Already have an account",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.normal),), const SizedBox(width: 10,),
                const Text("Sign In Here",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.blue),).onTap(()=>  const SignIn().launch(context))
              ],
            )
          ],
        ),
      ),
    );
  }
}
