import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';
import 'package:hostelmanagementproject/View/Admin_View/Edit_Profile_Student.dart';

class StudentsProfileList extends StatelessWidget {
  StudentsProfileList({super.key});

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
          title: Text("STUDENTS",style: TextStyle(color: kTextwhiteColor,fontSize: 25,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Students").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return CircularProgressIndicator();
            }
            if(snapshot.hasData)
            {
              return ListView.separated(itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileStudent(Id: snapshot.data!.docs[index].id,),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(snapshot.data!.docs[index]["firstName"],style: TextStyle(fontSize: 25,color: kTextwhiteColor,fontWeight: FontWeight.w300),),
                          SizedBox(width: 5,),
                          Text(snapshot.data!.docs[index]["lastName"],style: TextStyle(fontSize: 25,color: kTextwhiteColor,fontWeight: FontWeight.w300),)
                        ],
                      ),
                    )
                  ],
                );
              },
                itemCount: snapshot.data!.docs.length, separatorBuilder: (BuildContext context, int index) {
                return Divider();
                },
              );
            }
            else
            {
              return Text("Error");
            }
          },

        )
    );
  }
}
