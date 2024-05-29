import 'package:flutter/material.dart';

import '../Constants/theme_const.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailcntr = TextEditingController();
  GlobalKey<FormState> mykey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager().primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/forgetpassword.png")),
                      shape: BoxShape.circle)),
              SizedBox(
                height: 15,
              ),
              Text(
                "Forget Password",
                style: TextStyle(
                    fontSize: 25,
                    color: kTextwhiteColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Provide your account's email for which you want to reset your password",
                  style: TextStyle(fontSize: 16, color: kTextwhiteColor)),
              SizedBox(
                height: 40,
              ),
              Form(
                  key: mykey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required Field";
                          }
                        },
                        controller: emailcntr,
                        style:TextStyle(color:bgColorscaffold),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "youremail@gmail.com",
                            hintStyle: TextStyle(color:bgColorscaffold ),
                            fillColor: kTextwhiteColor,

                            prefixIcon: Container(
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.email_outlined,color:bgColorscaffold ,),
                            ),
                            filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
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
                            if(mykey.currentState!.validate())
                              {
                                print("button pressed");
                              }
                            },
                          child: Text("RESET",style: TextStyle(fontSize: 20),),
                           ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
