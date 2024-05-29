import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';
import 'package:hostelmanagementproject/View/LoginPage.dart';
import 'package:hostelmanagementproject/View/Admin_View/roomnumber_students.dart';
import 'package:hostelmanagementproject/View/Admin_View/students_profile_list.dart';
import 'package:hostelmanagementproject/View/Admin_View/total_students.dart';
import 'package:hostelmanagementproject/View/foodmenu.dart';


class HomepageAdmin extends StatelessWidget {
  const HomepageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColorscaffold,
      ),
      body: Column(
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
                    Text('Admin',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                                  print("total rooms icon pressed");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>RoomStudents(),));
                                },
                                icon:Icon(Icons.house_outlined,size: 40,color: Colors.white,)
                              ),
                              TextButton(onPressed: () {
                                print("Total rooms textbutton");
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>RoomStudents(),));
                              }, child: Text("Total Rooms",textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall),),
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
                                  onPressed: () async{
                                    print("total students icon pressed");

                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>TotalStudents() ,));
                                  },
                                  icon:Icon(Icons.people_alt_outlined,size: 40,color: Colors.white,)
                              ),
                              TextButton(onPressed: () async{
                                print("Total students textbutton");

                                Navigator.push(context, MaterialPageRoute(builder: (context) =>TotalStudents() ,));
                              }, child: Text("Total Students",textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall),),
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
      ),
      drawer: Drawer(
        child: ListView(
          children: [UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: bgColorscaffold,
            ),
              accountName: Text("Admin",style: TextStyle(fontSize: 20),),
              accountEmail: Text("admin@gmail.com",style: TextStyle(fontSize: 20)),
    currentAccountPicture: CircleAvatar(
    backgroundColor: kTextwhiteColor,
          ),),

            ListTile(
              leading: Icon(Icons.person),
              title: TextButton(onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsProfileList(),));
              }, child: Text("Students Profile",style: TextStyle(color: bgColorscaffold,fontSize: 20)),),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: TextButton(onPressed: () {

              }, child: Text("Leave History",style: TextStyle(color: bgColorscaffold,fontSize: 20)),),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: TextButton(onPressed: () {

              }, child: Text("Complaints",style: TextStyle(color: bgColorscaffold,fontSize: 20)),),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: bgColorscaffold),
              title: TextButton(onPressed: () async{
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
                await FirebaseAuth.instance.signOut();
              }, child: Text("Logout",style: TextStyle(color: bgColorscaffold,fontSize: 20)),),
            )
          ]
        )
      ),
    );
  }
}
