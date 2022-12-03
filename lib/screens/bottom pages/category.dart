import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Category"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5),
                  itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width*45.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff0601B4),
                    borderRadius: BorderRadius.circular(10.0)
                  ),child: Center(child: const Text("Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white),)),
                );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
