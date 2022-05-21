import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:chattt/main.dart';
import 'package:restart_app/restart_app.dart';

class Groups extends StatelessWidget {
  const Groups({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
    child: MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black12,
        accentColor: Colors.deepOrangeAccent,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme
              .of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),

      ),
      home: Scaffold(

        backgroundColor: Colors.black12,


        body: Center(

    child: Container(

            child: RaisedButton(

              child: Text("Sign out"),

              onPressed: () {
                FirebaseAuth.instance.signOut();

                Restart.restartApp();

              },


            )
        ),
        ),

      ),

    ));
  }
}

