import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Constants/theme_const.dart';

class EditProfileStudent extends StatelessWidget {
  EditProfileStudent({super.key, required this.Id});
  final String Id;
  TextEditingController nameCntr=TextEditingController();
  TextEditingController emailCntr=TextEditingController();
  TextEditingController phoneCntr=TextEditingController();
  TextEditingController roomCntr=TextEditingController();

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
          "EDIT PROFILE",
          style: TextStyle(fontSize:25,color: kTextwhiteColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream:  FirebaseFirestore.instance.collection("Students").doc("${Id}").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    if (snapshot.hasData && snapshot.data!.exists) {
    Map<String, dynamic> documentFields = snapshot.data!.data() as Map<String, dynamic>;}
            // nameCntr.text=documentFields["firstName"];
            // emailCntr.text=documentFields["email"];
            // phoneCntr.text=documentFields["phone"];
            // roomCntr.text=documentFields["roomNumber"];

            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(snapshot.hasData && snapshot.data!.exists){
              Map<String, dynamic> documentFields = snapshot.data!.data() as Map<String, dynamic>;
              nameCntr.text=documentFields["firstName"];
              emailCntr.text=documentFields["email"];
              phoneCntr.text=documentFields["phone"];
              roomCntr.text=documentFields["roomNumber"];
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller:nameCntr ,
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
                    height: 15,
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
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: phoneCntr,
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                    controller: roomCntr,
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
                    height: 15,
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
                        onPressed: () {
                          var id=Id;
                          FirebaseFirestore.instance.collection("Students").doc(id).update({"roomNumber":roomCntr.text});
                        },
                        child: Text("SAVE",style: TextStyle(fontSize: 20),),
                      ),
                    ),
                  )
                ],
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
