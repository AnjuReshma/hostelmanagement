import 'package:flutter/material.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';
import 'package:hostelmanagementproject/View/LoginPage.dart';

class Splashscreenpage extends StatelessWidget {
  const Splashscreenpage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
    });
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hostel",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kTextwhiteColor,
                      fontSize: 50.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                ),
                Text(
                  " Happy",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kTextwhiteColor,
                      fontSize: 50.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                )
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/hostellogo.jpg")),shape: BoxShape.circle)
            ),
            // Image.asset(
            //   "assets/images/hostellogo.jpg",
            //   height: 150,
            //   width: 150,
            // )
          ],
        ),
      ),
    );
  }
}
