import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';

class TotalStudents extends StatelessWidget {
   TotalStudents({super.key});

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
            return ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kTextwhiteColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(snapshot.data!.docs[index]["firstName"],style: TextStyle(color: bgColorscaffold,fontSize: 23,fontWeight: FontWeight.w600),),
                              SizedBox(width: 5,),
                              Text(snapshot.data!.docs[index]["lastName"],style: TextStyle(color: bgColorscaffold,fontSize: 23,fontWeight: FontWeight.w600),)
                            ],

                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Room Number: ",style: TextStyle(color: bgColorscaffold,fontSize: 20)),
                          Text(snapshot.data!.docs[index]["roomNumber"],style: TextStyle(color: bgColorscaffold,fontSize: 20),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Phone Number: ",style: TextStyle(color: bgColorscaffold,fontSize: 20)),
                          Text(snapshot.data!.docs[index]["phone"],style: TextStyle(color: bgColorscaffold,fontSize: 20),),
                        ],
                      ),
                    ],
                  ) ,
                ),
              );
            },
          itemCount: snapshot.data!.docs.length,
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
