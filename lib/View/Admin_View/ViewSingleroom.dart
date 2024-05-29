import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';

class ViewSingleRoom extends StatelessWidget {
  const ViewSingleRoom({super.key, required this.roomNum});
  final String roomNum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColorscaffold,
        foregroundColor: kTextwhiteColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),),
        title: Text(roomNum,style: TextStyle(color: kTextwhiteColor,fontWeight: FontWeight.w600,fontSize: 25),),
        centerTitle: true,
      ),
      body:Center(
     child: Column(
       children: [

         Text("ROOM MEMBERS",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600,color: kTextwhiteColor),),
         SizedBox(height: 15,),
         Flexible(
           child: StreamBuilder(
               stream: FirebaseFirestore.instance.collection("Students").where("roomNumber", isEqualTo: roomNum).snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                 if(snapshot.connectionState == ConnectionState.waiting)
                   {
                     return CircularProgressIndicator();
                   }
                 if(snapshot.hasData)
                   {
                     return ListView.builder(itemBuilder: (context, index) {
                       return Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Container(
           
                               decoration: BoxDecoration(
                                 color: kTextwhiteColor,
                                 borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text(snapshot.data!.docs[index]["firstName"],style: TextStyle(color: bgColorscaffold,fontSize: 20),),
                                       SizedBox(width: 5,),
                                       Text(snapshot.data!.docs[index]["lastName"],style: TextStyle(color: bgColorscaffold,fontSize: 20))
                                     ],
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ],
                       );
                     },itemCount: snapshot.data!.docs.length,);
                   }
                 else
                   {
                     return Text("Error");
                   }
               }, ),
         ),
       ],
     ),
      )
    );
  }
}
