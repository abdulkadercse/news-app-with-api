import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/repository/auth_repo.dart';
import 'package:news_app_with_api/screens/bottom%20navigration/bottom_navigation.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController updateFirstName = TextEditingController();
  TextEditingController updateLastName = TextEditingController();
  TextEditingController updateEmailAddress = TextEditingController();
  TextEditingController updatePhoneNumber = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: updateFirstName,
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
                textFieldType: TextFieldType.NAME,
                controller: updateLastName,
                decoration: const InputDecoration(
                    hintText: "Enter your last name",
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
                controller: updateEmailAddress,
                decoration: const InputDecoration(
                    hintText: "Enter your Email address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    fillColor: Colors.white,
                    filled: true),
              ),
              const SizedBox(
                height: 10.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: updatePhoneNumber,
                decoration: const InputDecoration(
                    hintText: "Enter your phone",
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
                    color: const Color(0xff0601B4)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Update Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ).onTap(() async {
                EasyLoading.show(status: "Updating Data");
                var result = await AuthRepo().updateProfileRepo(
                    updateFirstName.text,
                    updateLastName.text,
                    updateEmailAddress.text,
                    updatePhoneNumber.text);
                if (result) {
                  EasyLoading.showSuccess("Data Updated");
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('fName', updateFirstName.text);
                  await prefs.setString('lName', updateLastName.text);
                  await prefs.setString('email', updateEmailAddress.text);
                  await prefs.setString('phone', updatePhoneNumber.text);
                  const BottomNav().launch(context);
                } else {
                  EasyLoading.showError("Failed");
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
