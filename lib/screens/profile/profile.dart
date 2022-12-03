import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_app_with_api/screens/profile/change_password.dart';

import 'edit_profile.dart';
import 'my_account.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: const Color(0xff0601B4),
                    borderRadius: BorderRadius.circular(10.0)),
                child:  Center(
                  child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.amber,
                      ),
                      title: const Text(
                        "User Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                      subtitle: const Text(
                        "test@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            color: Color(0xffD7D7D7)),
                      ),
                      trailing: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ).onTap(()=> const EditProfile().launch(context))
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyAccount()),
                  );
                },
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20.0,
                    child: Icon(
                      Icons.person,
                      color: Color(0xff0601B4),
                    ),
                  ),
                  title: Text(
                    "My Account ",
                    style: TextStyle(
                        color: Color(0xff181D27), fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Make changes to your account ",
                    style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20.0,
                  child: Icon(
                    Icons.person,
                    color: Color(0xff0601B4),
                  ),
                ),
                title: Text(
                  "Saved Beneficiary ",
                  style: TextStyle(
                      color: Color(0xff181D27), fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Manage your saved account ",
                  style: TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20.0,
                  child: Icon(
                    Icons.lock,
                    color: Color(0xff0601B4),
                  ),
                ),
                title: Text(
                  "Two-Factor Authentication ",
                  style: TextStyle(
                      color: Color(0xff181D27), fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Further secure your account for safety ",
                  style: TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChangePassword()),
                  );
                },
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20.0,
                    child: Icon(
                      Icons.lock,
                      color: Color(0xff0601B4),
                    ),
                  ),
                  title: Text(
                    "Password Change ",
                    style: TextStyle(
                        color: Color(0xff181D27), fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    " Change Your Password",
                    style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20.0,
                  child: Icon(
                    Icons.login,
                    color: Color(0xff0601B4),
                  ),
                ),
                title: Text(
                  "Log out ",
                  style: TextStyle(
                      color: Color(0xff181D27), fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Further secure your account for safety",
                  style: TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ),
              const ListTile(
                title: Text(
                  "More ",
                  style: TextStyle(
                      color: Color(0xff181D27), fontWeight: FontWeight.bold),
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20.0,
                  child: Icon(
                    Icons.notification_important_rounded,
                    color: Color(0xff0601B4),
                  ),
                ),
                title: Text(
                  "Help & Support ",
                  style: TextStyle(
                      color: Color(0xff181D27), fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20.0,
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xff0601B4),
                  ),
                ),
                title: Text(
                  "About App",
                  style: TextStyle(
                      color: Color(0xff181D27), fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
