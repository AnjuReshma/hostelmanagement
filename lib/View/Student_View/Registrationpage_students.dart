import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hostelmanagementproject/Controller/controller_reg_stud.dart';
import 'package:provider/provider.dart';
import '../../Constants/theme_const.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegistrationPageStudents extends StatelessWidget {
  RegistrationPageStudents({super.key});

  TextEditingController frstnameCntr = TextEditingController();
  TextEditingController lastnameCntr = TextEditingController();
  TextEditingController emailCntr = TextEditingController();
  TextEditingController passwordCntr = TextEditingController();
  TextEditingController phoneCntr = TextEditingController();
  TextEditingController roomCntr = TextEditingController();

  String dropdownvalue = 'Pending';
  GlobalKey<FormState> mykey = GlobalKey();
  final List<String> rooms = ["201", "202", "203", "204", "205"];

  String? SelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColorscaffold,
        leading: IconButton(
          color: kTextwhiteColor,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontSize: 25,
                  color: kTextwhiteColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text("Create your account",
                  style: TextStyle(fontSize: 20, color: kTextwhiteColor))),
          SizedBox(
            height: 20,
          ),
          Form(
            key: mykey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: frstnameCntr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      }
                    },
                    style: TextStyle(
                      color: bgColorscaffold,
                      fontSize: 20.0,
                        fontWeight: FontWeight.w300
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "First Name",
                        hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: bgColorscaffold,
                            height: 0.5
                        ),
                        fillColor: kTextwhiteColor,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.person,
                            color: bgColorscaffold,
                          ),
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: lastnameCntr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: bgColorscaffold,
                      fontSize: 20.0,
                        fontWeight: FontWeight.w300
                    ),
                    decoration: InputDecoration(
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                          color: bgColorscaffold,
                          fontSize: 20.0,
                        ),
                        fillColor: kTextwhiteColor,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.person,
                            color: bgColorscaffold,
                          ),
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: emailCntr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: bgColorscaffold,
                      fontSize: 20.0,
                        fontWeight: FontWeight.w300
                    ),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: bgColorscaffold,
                          fontSize: 20.0,
                        ),
                        fillColor: kTextwhiteColor,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.email_outlined,
                            color: bgColorscaffold,
                          ),
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: passwordCntr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                      color: bgColorscaffold,
                      fontSize: 20.0,
                        fontWeight: FontWeight.w300
                    ),
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: bgColorscaffold,
                          fontSize: 20.0,
                        ),
                        fillColor: kTextwhiteColor,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.password,
                            color: bgColorscaffold,
                          ),
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: phoneCntr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      }
                    },
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      color: bgColorscaffold,
                      fontSize: 20.0,
                        fontWeight: FontWeight.w300
                    ),
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: bgColorscaffold,
                          fontSize: 20.0,
                        ),
                        fillColor: kTextwhiteColor,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.phone,
                            color: bgColorscaffold,
                          ),
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButtonFormField(
                    items: rooms.map((e) {
                      return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              color: bgColorscaffold,
                              fontSize: 20.0,
                                fontWeight: FontWeight.w300
                            ),
                          ));
                    }).toList(),
                    onChanged: (value) async {
                      print(value);
                      dropdownvalue = value!;
                    },
                    decoration: InputDecoration(
                        hintText: "Select Room Number",
                        hintStyle: TextStyle(
                          color: bgColorscaffold,
                          fontSize: 20.0,
                            fontWeight: FontWeight.w300
                        ),
                        prefixIcon: Icon(Icons.home,color: bgColorscaffold),
                        fillColor: kTextwhiteColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: bgColorscaffold,
                        foregroundColor: kTextwhiteColor,
                        side: BorderSide(color: kTextwhiteColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () async {
                        if (mykey.currentState!.validate()) {
                          print("Button Pressed");
                        }
                        Provider.of<ControllerRegStud>(context,listen: false).regAuthentication(emailCntr.text, passwordCntr.text, frstnameCntr.text, lastnameCntr.text, phoneCntr.text, dropdownvalue);
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
