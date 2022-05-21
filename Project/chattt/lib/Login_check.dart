import 'package:chattt/main.dart';
import 'package:chattt/groups.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


    if (FirebaseAuth.instance.currentUser != null) {
      runApp(Groups());
    }
    else {
      runApp(MainPage());
    }



}


