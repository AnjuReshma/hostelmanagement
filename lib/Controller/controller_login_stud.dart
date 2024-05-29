import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hostelmanagementproject/View/Admin_View/Homepage_admin.dart';

import '../View/Student_View/Homepage_Students.dart';

class ControllerLoginStud extends ChangeNotifier{
  loginauthenticate(email,password) async {
    try {
      final ref = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      if (ref.user!.uid != null) {
        Fluttertoast.showToast(msg: "Login Success");

      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: "Failed due to ${e.code}");
    }
    notifyListeners();
  }

  // final FirebaseAuth _auth=FirebaseAuth.instance;

   getCurrentUser()  {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final myUid = user!.uid;
    return myUid;

  }
  notifyListeners();
}
