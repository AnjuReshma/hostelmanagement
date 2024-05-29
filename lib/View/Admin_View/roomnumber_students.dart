import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';
import 'package:hostelmanagementproject/View/Admin_View/ViewSingleroom.dart';

class RoomStudents extends StatelessWidget {
   RoomStudents({super.key});

  ValueNotifier <List<String>> rooms=ValueNotifier([
    "201",
    "202",
    "203",
    "204",
    "205"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColorscaffold,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,),
          color: kTextwhiteColor,
        ),
        title: Text("ROOMS",style: TextStyle(color: kTextwhiteColor,fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable:rooms ,
          builder: (BuildContext context, rooms, Widget? child) {

            return ListView.separated(itemBuilder: (context, index) {
              final data = rooms[index];
              return ListTile(
                title: Text(data,style: TextStyle(color: kTextwhiteColor,fontSize: 20),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewSingleRoom(roomNum: data,),));
                },
              );
            }, separatorBuilder: (context, index) {
              return Divider();
            }, itemCount: rooms.length);

          },

        ),
      ),
    );
  }
}
