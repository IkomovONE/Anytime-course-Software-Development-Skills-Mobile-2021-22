import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chattt/Groups.dart';
import 'package:chattt/Login.dart';






class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {



    return Center(


        child: Container(


          child: LoadingAnimationWidget.dotsTriangle(
            color: Colors.deepOrangeAccent,
            size: 70,
          ),)
    );



  }


}







