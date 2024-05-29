import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ControllerRegStud extends ChangeNotifier{
  regAuthentication(email,password,frst,last,phone,room) async
  {
    try
    {
      final reference=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      final User? user = FirebaseAuth.instance.currentUser;
      final String uid = user!.uid;
      await FirebaseFirestore.instance.collection("Students").doc(uid).set({
        "studentId": uid,
        "firstName": frst,
        "lastName": last,
        "email": email,
        "phone": phone,
        "roomNumber": room
      });
      if(reference.user!.uid!=null){
        Fluttertoast.showToast(msg: "Registration Success");
      }
    }on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: "Failure due to ${e.code}");
    }
    notifyListeners();



  }


}