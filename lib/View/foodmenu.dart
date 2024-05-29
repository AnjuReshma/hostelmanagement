import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';

class FoosMenuScreen extends StatelessWidget {
  const FoosMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColorscaffold,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),
          color: kTextwhiteColor,
        ),
        title: Text("FOOD MENU",style: TextStyle(color: kTextwhiteColor,fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/foodmenu.png"),
        ),
      ) ,
    );
  }
}
