import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/Controller/controller_stud_profile.dart';
import 'package:provider/provider.dart';

import '../../Constants/theme_const.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import'package:path/path.dart';

class ProfileStudent extends StatefulWidget {
  ProfileStudent({super.key, required this.Id});
  final String Id;

  @override
  State<ProfileStudent> createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  TextEditingController nameCntr=TextEditingController();

  TextEditingController emailCntr=TextEditingController();

  TextEditingController phoneCntr=TextEditingController();

  TextEditingController roomCntr=TextEditingController();

   TextEditingController _passCntr= TextEditingController();

  TextEditingController _confirmPassCntr = TextEditingController();

  var _password = '';

  var _confirmPassword = '';

  GlobalKey <FormState> mykey=GlobalKey();

  File? image;

  Future<void> pickimage() async{
    final pick=await ImagePicker().pickImage(source: ImageSource.gallery);
    image=File(pick!.path);
    setState(() {

    });
  }

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
        title: Text(
          "PROFILE",
          style: TextStyle(fontSize:25,color: kTextwhiteColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
            stream:  FirebaseFirestore.instance.collection("Students").doc("${widget.Id}").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData && snapshot.data!.exists) {
                Map<String, dynamic> documentFields = snapshot.data!.data() as Map<String, dynamic>;}

              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              if(snapshot.hasData && snapshot.data!.exists){
                Map<String, dynamic> documentFields = snapshot.data!.data() as Map<String, dynamic>;
                nameCntr.text=documentFields["firstName"];
                emailCntr.text=documentFields["email"];
                phoneCntr.text=documentFields["phone"];
                roomCntr.text=documentFields["roomNumber"];
                return Form(
                  key: mykey,
                  child: ListView(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            image!=null?CircleAvatar(
                              radius: 64,
                              backgroundImage: Image.file(image!).image,
                            ):
                            CircleAvatar(
                              radius: 64,
                            ),
                            Positioned(child: IconButton(onPressed: (){
                              pickimage();
                            }, icon: Icon(Icons.add_a_photo_outlined,color: Colors.grey[900],)
                            ),
                              bottom: -10,
                              left: 80,
                            )
                          ],
                        ),
                      ),

                  SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller:nameCntr ,
                          style: TextStyle(color: bgColorscaffold,fontSize: 20,fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              fillColor: kTextwhiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: emailCntr,
                          readOnly: true,
                          style: TextStyle(color: bgColorscaffold,fontSize: 20,fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              fillColor: kTextwhiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: _passCntr,
                          onChanged: (value){
                            _password = value;
                          },
                          // validator: (value) {
                          //   if (value != null && value.isEmpty) {
                          //     return 'Password is required please enter';
                          //   }
                          //   // you can check password length and specifications
                          //
                          //   return null;
                          // },
                          style: TextStyle(color: bgColorscaffold,fontSize: 20,fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                            hintText: 'Password',
                              fillColor: kTextwhiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller:_confirmPassCntr ,
                                validator: (value) {
                                // if (value != null && value.isEmpty) {
                                // return 'Conform password is required please enter';
                                // }
                                if(value != _password){
                                return 'Confirm password not matching';
                                }
                                return null;
                                },
                          style: TextStyle(color: bgColorscaffold,fontSize: 20,fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                            hintText: 'Re-enter Password',
                              fillColor: kTextwhiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: phoneCntr,
                          style: TextStyle(color: bgColorscaffold,fontSize: 20,fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              fillColor: kTextwhiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: roomCntr,
                          readOnly: true,
                          style: TextStyle(color: bgColorscaffold,fontSize: 20,fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              fillColor: kTextwhiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
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
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            onPressed: () async{
                              if(mykey.currentState!.validate())
                              {
                              }
                              Provider.of<ControllerStudProfile>(context,listen: false).updateProfile(nameCntr.text,phoneCntr.text,_confirmPassCntr);

                              Reference ref = FirebaseStorage.instance.ref().child("images").child("${widget.Id}.jpg");
                              await ref.putFile(image!);

                             },
                            child: Text("SAVE",style: TextStyle(fontSize: 20),),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              else{
                return Text("Error");
              }
            }
        ),
      ),
    );
  }
}
