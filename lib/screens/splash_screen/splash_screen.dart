import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../authentication/sign_in.dart';
import '../bottom pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> goHomeScreen()async{
    final prefs = await SharedPreferences.getInstance();
     String? token =   prefs.getString("token");
    Future.delayed(const Duration(seconds: 2)).then((value) {

      if(token.isEmptyOrNull){
        const HomeScreen().launch(context);
      }else{
        const SignIn().launch(context);
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: CircleAvatar(
          backgroundColor: Color(0xffF49D1A),
          radius: 00.0,
          child: Text(
            "News App",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),
          ),

        ),
      ),
    );
  }
}
