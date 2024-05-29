import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ControllerStudProfile extends ChangeNotifier{
  Future<void> updateProfile(name,phone,password) async{
    final user = FirebaseAuth.instance.currentUser;
    var id=user!.uid;
    FirebaseFirestore.instance.collection("Students").doc(id).update({"firstName":name,"phone":phone});


    if (user != null) {

      debugPrint('password has been changed');
      await user.updatePassword(password.text);
    } else {
      debugPrint("password hasnt been changed");
      // No user is signed in.
    }
    notifyListeners();
  }

}