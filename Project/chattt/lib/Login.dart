import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chattt/main.dart';
import 'package:chattt/Groups.dart';
import 'package:chattt/Loading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async => false,
    child: GestureDetector(
        onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    },
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black12,
          accentColor: Colors.deepOrangeAccent,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          ),
        ),

        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(45.0),
            child: AppBar(

                backgroundColor: Colors.black12,


                automaticallyImplyLeading: false,
                leadingWidth: 200,
                leading: Align(
                    alignment: Alignment.centerRight,
                    child: Container(

                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: const BorderRadius.all(Radius.circular(15)),),

                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const MainPage()),

                                (Route<dynamic> route) => false,),

                          icon: const Icon(Icons.arrow_back_ios, size: 40, color: Colors.deepOrangeAccent),
                          label: const Text('Back', style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20, fontWeight: FontWeight.bold,),),

                          style: ElevatedButton.styleFrom(
                              elevation: 0, primary: Colors.transparent),
                        )
                    )))),

            //the appBar back button is taken from "https://www.kindacode.com/snippet/flutter-creating-custom-back-buttons/"


          backgroundColor: Colors.black12,

          body: Columns(), // here the desired height

        ))));
  }
}





class Columns extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(

        child: Column(mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,


            children: <Widget>[




              Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                PassFields() ]),



            ]));
  }
}









class PassFields extends StatefulWidget {

  ChangePassword createState() => ChangePassword();
}


class ChangePassword extends State {
  late String password= "";
  late String nickname= "";


  SetPassword(String value){
    setState(() {
      password= value;
    }
    );
  }

  SetNickname(String nick){
    setState(() {
      nickname= nick;
    }
    );
  }



  @override
  Widget build(BuildContext context) {

    return  Column(

      children: <Widget>[

        Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).accentColor, width: 2),
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Align( alignment: Alignment.center,
            child: TextFormField(

                onChanged: (nick) {

                  SetNickname(nick);

                },

                cursorColor: Colors.deepOrange,
                cursorWidth: 7.0,


                decoration: const InputDecoration(
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),

                    focusedBorder: InputBorder.none,
                    hintText: "Your nickname",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),),
        ),


        SizedBox(height: 50),




        Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).accentColor, width: 2),
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Align( alignment: Alignment.center,
        child: TextFormField(

          onChanged: (value) {

              SetPassword(value);


          },
            cursorColor: Colors.deepOrange,
            cursorWidth: 7.0,
            obscureText: true,
            decoration: const InputDecoration(
                contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Your Password",
                hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),),
    ),

        SizedBox(height: 80),


     Container(
      height: 50,
      width: 350,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrangeAccent, width: 2),

        borderRadius: const BorderRadius.all(const Radius.circular(15)),
      ),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
          onPressed: () {


          Auth().signUp(nickname: nickname, password: password);


          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Loading()),
          );




          Future<void> Check() async{

            await Future<void>.delayed(Duration(seconds: 2), () {


              if (FirebaseAuth.instance.currentUser != null) {

                Navigator.of(context).pushAndRemoveUntil(RouteToGroups(),
                      (Route<dynamic> route) => false,);

              }

              else {

                Navigator.pop(context);

                showAlertDialog(context);

                print("Not signed in");
              }

            });
          }


          Check();






          },
          child: const Text("Login",
            style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
                fontSize: 25.0,
                fontStyle: FontStyle.normal),
          )

      ),
    ),],);



  }

  showAlertDialog(BuildContext context) {

    Widget okButton = FlatButton(


        onPressed: () {

          Navigator.of(context, rootNavigator: true).pop();

        },


        child: Text("OK", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 25, fontWeight: FontWeight.bold),),);



    AlertDialog alert = AlertDialog(


      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),

          side: BorderSide(color: Colors.deepOrangeAccent)),






        backgroundColor: Colors.black,


      title: const Text("Wrong credentials!", style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold, fontSize: 20), ),

      actions: [

        okButton,

      ]
    );




      showDialog(

        context: context,

        builder: (BuildContext context) {

          return alert;
        }


      );







  }

}






class Auth {



  Future<String> signUp({required String nickname, required String password}) async{

    late final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
    try{

         _firebaseAuth.signInWithEmailAndPassword(email: nickname, password: password);


      return "Signed in";
    }
    on FirebaseAuthException catch (e) {
      return "Error";
    }
  }
}






Route RouteToGroups() {
  var curve = Curves.ease;
  var curveTween = CurveTween(curve: curve);
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Groups(),

    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(4.0, 6.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      var tweeen = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tweeen),
        child: child,
      );

      //https://docs.flutter.dev/cookbook/animation/page-route-animation
    },
  );
}


