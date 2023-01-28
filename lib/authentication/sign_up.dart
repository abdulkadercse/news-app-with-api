import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/authentication/sign_in.dart';
import 'package:news_app_with_api/repository/auth_repo.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Lottie.asset('assets/signup.json',fit: BoxFit.cover),
              const SizedBox(height: 10.0,),
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

              ElevatedButton(onPressed: ()async{
                if(firstNameController.text.isEmpty){
                  toast("Please Enter your first name");
                }else if(lastNameController.text.isEmpty){
                  toast("Please Enter your last name");
                }
                else if(lastNameController.text.isEmpty){
                  toast("Please Enter  your email address");
                }
                else if(lastNameController.text.isEmpty){
                  toast("Please Enter  your email address");
                }
                else if(phoneController.text.isEmpty){
                  toast("Please Enter  your Phone number");
                }
                else if(passwordController.text.isEmpty){
                  toast("Please Enter  your password");
                }
                else if(confirmPasswordController.text.isEmpty){
                  toast("Please Enter  your confirm password");
                }else{
                  try{
                    EasyLoading.show(status: "Sign Up..");
                    bool status = await AuthRepo().signUpWithEmail(firstNameController.text, lastNameController.text, emailController.text, phoneController.text, passwordController.text, confirmPasswordController.text);
                    if(status){
                      EasyLoading.showSuccess("Sign up success ");
                    }else{
                      SignIn().launch(context);
                    }
                  }
                  catch(e){
                    EasyLoading.showError(e.toString());
                  }
                }
              }, child: Row(
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
      ),
    );
  }
}
