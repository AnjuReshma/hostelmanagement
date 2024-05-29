import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/View/LoginPage.dart';
import 'package:hostelmanagementproject/View/Student_View/Profile_Student.dart';
import 'package:hostelmanagementproject/View/foodmenu.dart';

import '../../Constants/theme_const.dart';

class Homepagestudents extends StatelessWidget {
   Homepagestudents({super.key, required this.Id});

   final String Id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColorscaffold,
      ),
      drawer: Drawer(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Students").doc("${Id}").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {

              if(snapshot.connectionState==ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
    if(snapshot.hasData && snapshot.data!.exists){
      Map<String, dynamic> documentFields = snapshot.data!.data() as Map<String, dynamic>;
      return ListView(
          children: [UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: bgColorscaffold,
            ),
            accountName: Text(documentFields["firstName"]),
            accountEmail: Text(documentFields["email"]),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/hostellogo.jpg"),
              backgroundColor: Colors.white,
            ),),
            ListTile(
              leading: Icon(Icons.person),
              title: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfileStudent(Id: Id,) ,));

              }, child: Text("Profile",style: TextStyle(color: bgColorscaffold),),),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: TextButton(onPressed: () {

              }, child: Text("Leave History",style: TextStyle(color: bgColorscaffold)),),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: TextButton(onPressed: () {

              }, child: Text("Complaints",style: TextStyle(color: bgColorscaffold)),),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: bgColorscaffold,),
              title: TextButton(onPressed: () async{
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
                await FirebaseAuth.instance.signOut();
              }, child: Text("Logout",style: TextStyle(color: bgColorscaffold)),),
            )
          ]
      );
    }
    else{
      return Text("Error");
    }

            },
          )
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Students").doc("${Id}").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
    if(snapshot.hasData && snapshot.data!.exists){
    Map<String, dynamic> documentFields = snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hi ',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: kTextwhiteColor
                        ),),
                        Text(documentFields["firstName"],style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: kTextwhiteColor
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: kOtherColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kDefaultPadding*3),
                          topRight: Radius.circular(kDefaultPadding*3),
                        )
                    ),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:60),
                              width: MediaQuery.of(context).size.width/2.5,
                              height: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  color: bgColorscaffold,
                                  borderRadius: BorderRadius.circular(kDefaultPadding/2)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        print("rooms details");
                                      },
                                      icon:Icon(Icons.house_outlined,size: 40,color: Colors.white,)
                                  ),
                                  TextButton(onPressed: () {
                                    print("room details textbutton");
                                  }, child: Text("Room Details",textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall),),
                                  SizedBox(height: kDefaultPadding/3,)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:60),
                              width: MediaQuery.of(context).size.width/2.5,
                              height: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  color: bgColorscaffold,
                                  borderRadius: BorderRadius.circular(kDefaultPadding/2)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        print("Leave pressed");
                                      },
                                      icon:Icon(Icons.note_add_outlined,size: 40,color: Colors.white,)
                                  ),
                                  TextButton(onPressed: () {
                                    print("Leave textbutton");
                                  }, child: Text("Leave",textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall),),
                                  SizedBox(height: kDefaultPadding/3,)
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:60),
                              width: MediaQuery.of(context).size.width/2.5,
                              height: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  color: bgColorscaffold,
                                  borderRadius: BorderRadius.circular(kDefaultPadding/2)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        print("Attendance icon pressed");
                                      },
                                      icon:Icon(Icons.library_books_sharp,size: 40,color: Colors.white,)
                                  ),
                                  TextButton(onPressed: () {
                                    print("Attendance text button");
                                  }, child: Text("Attendance",textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall),),
                                  SizedBox(height: kDefaultPadding/3,)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:60),
                              width: MediaQuery.of(context).size.width/2.5,
                              height: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  color: bgColorscaffold,
                                  borderRadius: BorderRadius.circular(kDefaultPadding/2)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        print("Food menu icon pressed");
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => FoosMenuScreen(),));
                                      },
                                      icon:Icon(Icons.restaurant_menu,size: 40,color: Colors.white,)
                                  ),
                                  TextButton(onPressed: () {
                                    print("food menu textbutton");
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FoosMenuScreen(),));
                                  }, child: Text("Food Menu",textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall),),
                                  SizedBox(height: kDefaultPadding/3,)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );}
      else{
      return Text("Error");
       }
        },
      ),
    );
  }
}
