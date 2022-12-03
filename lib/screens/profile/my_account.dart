import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        title: const Text("User Profile"),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blue,
            ),
            const SizedBox(height: 10.0,),
            Container(
              height: MediaQuery.of(context).size.height/12,
              decoration: BoxDecoration(
                color: const Color(0xff0601B4),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: const ListTile(
                leading: Icon(Icons.person,color: Colors.white,),
                title: Text("Name: Abdul Kader",style: TextStyle(color: Colors.white),),
              )
            ),
            const SizedBox(height: 10.0,),
            Container(
              height: MediaQuery.of(context).size.height/12,
              decoration: BoxDecoration(
                color: const Color(0xff0601B4),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: const ListTile(
                leading: Icon(Icons.email,color: Colors.white,),
                title: Text("Email: test@gmail.com",style: TextStyle(color: Colors.white),),
              )
            ),
            const SizedBox(height: 10.0,),
            Container(
              height: MediaQuery.of(context).size.height/12,
              decoration: BoxDecoration(
                color: const Color(0xff0601B4),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: const ListTile(
                leading: Icon(Icons.call,color: Colors.white,),
                title: Text("Phone: 01630437666",style: TextStyle(color: Colors.white),),
              )
            ),
          ],
        ),
      ),
    );
  }
}
