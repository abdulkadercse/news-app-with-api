import 'package:flutter/material.dart';
import 'package:news_app_with_api/screens/bottom%20navigration/bottom_navigation.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../authentication/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> goHomeScreen() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    if (token.isEmptyOrNull) {
      await Future.delayed(const Duration(seconds: 2))
          .then((value) => const SignIn().launch(context, isNewTask: true));
    } else {
      await Future.delayed(const Duration(seconds: 2))
          .then((value) => const BottomNav().launch(context, isNewTask: true));
    }
  }

  @override
  void initState() {
    goHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: CircleAvatar(
          backgroundColor: Color(0xffF49D1A),
          radius: 80.0,
          child: Text(
            "News App",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
