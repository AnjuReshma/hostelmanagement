import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hostelmanagementproject/Constants/theme_const.dart';
import 'package:hostelmanagementproject/Controller/controller_login_stud.dart';
import 'package:hostelmanagementproject/View/Forgetpassword_page.dart';
import 'package:hostelmanagementproject/View/Student_View/Homepage_Students.dart';
import 'package:hostelmanagementproject/View/Admin_View/Homepage_admin.dart';
import 'package:hostelmanagementproject/View/Student_View/Registrationpage_students.dart';
import 'package:provider/provider.dart';

late bool _passwordVisible;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> mykey = GlobalKey();
  TextEditingController emailcntr=TextEditingController();
  TextEditingController passwordcntr=TextEditingController();
  // final FirebaseAuth _auth=FirebaseAuth.instance;
  //
  // getCurrentUser() async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   final myUid = user!.uid;
  //   print(myUid);
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 250,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/hostellogo.jpg")),
                          shape: BoxShape.circle)),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3)),
                color: kOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Form(
                        key: mykey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailcntr,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required Field";
                                }
                              },
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: bgColorscaffold,
                                  fontWeight: FontWeight.w300),
                              decoration: InputDecoration(
                                  hintText: "Email",

                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: kTextBlackColor,
                                      height: 0.5),
                                  hintStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: bgColorscaffold,
                                      height: 0.5),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kTextLightColor, width: 0.7)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kTextLightColor)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: bgColorscaffold))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordcntr,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required Field";
                                }
                              },
                              obscureText: !_passwordVisible,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(
                                  color: bgColorscaffold,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300),
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      icon: Icon(_passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                                  labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: kTextBlackColor,
                                      height: 0.5),
                                  hintStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: bgColorscaffold,
                                      height: 0.5),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kTextLightColor, width: 0.7)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kTextLightColor)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: bgColorscaffold))),
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: (){
                                  print("Forget password");
                                },
                               child:TextButton(onPressed: () {
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
                               }, child: Text("Forget Password?",
                                   style: TextStyle(
                                       color: bgColorscaffold, fontSize: 20.0)),)
                              ),
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        if(mykey.currentState!.validate()){
                                          print("Button Clicked");
                                        }
                                        Provider.of<ControllerLoginStud>(context,listen: false).loginauthenticate(emailcntr.text, passwordcntr.text);
                                        final String uid=    Provider.of<ControllerLoginStud>(context,listen: false).getCurrentUser();
                                        final user=FirebaseAuth.instance.currentUser;
                                        if(user!=null){
                                        if (emailcntr.text == "admin@gmail.com" && passwordcntr.text== "admin123") {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (context) => HomepageAdmin(),));
                                        }
                                        else {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (context) => Homepagestudents(Id: uid,),));
                                        }}
                                        else{
                                          print("Invalid user name and password");
                                        }
                                      },
                                    child: Text("SIGN IN",style: TextStyle(fontSize: 20,color: kTextwhiteColor),),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(bgColorscaffold),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                                    ),
                                  ),

                                ),
                                SizedBox(width: 20,),
                                SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(onPressed: (){
                                      FirebaseAuth.instance.authStateChanges().listen((User? user) {
                                        // execute any logic depending on current authentication state
                                      });
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPageStudents(),));
                                    }, child: Text("SIGN UP",style: TextStyle(fontSize: 20),),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(kOtherColor),
                                          foregroundColor: MaterialStateProperty.all(bgColorscaffold),
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                                      ),))
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
