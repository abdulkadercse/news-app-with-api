import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        title: const Text("Edit Profile"),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: CircleAvatar(
                  radius: 40.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Center(
                  child: Text(
                    "Abdul Kader",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const Center(
                  child: Text(
                    "test@gmail.com",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffABABAB)),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                decoration: const InputDecoration(
                    hintText: "Enter your First Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    fillColor: Colors.white,
                    filled: true),
              ),
              const SizedBox(
                height: 10.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.EMAIL,
                decoration: const InputDecoration(
                    hintText: "Enter your Email Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    fillColor: Colors.white,
                    filled: true),
              ),
              const SizedBox(
                height: 10.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.PHONE,
                decoration: const InputDecoration(
                    hintText: "Enter your Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    fillColor: Colors.white,
                    filled: true),
              ),
              const SizedBox(
                height: 10.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.PASSWORD,
                decoration: const InputDecoration(
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    fillColor: Colors.white,
                    filled: true),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xff0601B4)
                ),child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Update Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),)
                  ],
                ),
              ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
