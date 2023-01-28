import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/authentication/sign_up.dart';
import 'package:news_app_with_api/screens/bottom%20navigration/bottom_navigation.dart';



import '../repository/auth_repo.dart';
import '../screens/otp screen/forgot_password.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/sign-in.json',fit: BoxFit.cover),
              const SizedBox(height: 10.0,),


              // First Name
              AppTextField(
                textFieldType: TextFieldType.EMAIL,
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Enter your Email Address",
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Email Address",
                    prefixIcon: Icon(Icons.person),
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
              // forgot password
              Container(
                alignment: Alignment.centerRight,
                  child: const Text("Forgot Password?",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)).onTap(()=>const ForgotPassword().launch(context)),
              const SizedBox(height: 10.0,),
              

              // sign in button
              ElevatedButton(onPressed: () async{
                if(emailController.text.isEmpty){
                  toast('Enter Your Email Address');
                }
                else if(passwordController.text.isEmpty){
                  toast('Enter Your Password');
                }
                else{
                  try{
                    EasyLoading.show(status: 'Singing In...');
                    bool status= await AuthRepo().signInWithEmail(emailController.text, passwordController.text);
                    if(status){
                      EasyLoading.showSuccess('Singing Successful...');
                        BottomNav().launch(context);
                    }
                    else{
                      EasyLoading.showError('Singing Filled');
                    }
                  }catch(e){
                     EasyLoading.showError(e.toString());
                  }
                }


              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Sign In",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                  ),
                ],
              )),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Already have an account",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.normal),), const SizedBox(width: 10,),
                  const Text("Sign Up Here",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.blue),).onTap(()=>  const SignUp().launch(context))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
