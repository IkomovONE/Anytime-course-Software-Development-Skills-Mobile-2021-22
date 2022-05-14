import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chattt/main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
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
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_ios, size: 40, color: Colors.deepOrangeAccent),
                          label: const Text('Back', style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20, fontWeight: FontWeight.bold,),),

                          style: ElevatedButton.styleFrom(
                              elevation: 0, primary: Colors.transparent),
                        )
                    )))),

            //the appBar back button is taken from "https://www.kindacode.com/snippet/flutter-creating-custom-back-buttons/"


          backgroundColor: Colors.black12,

          body: Columns(), // here the desired height

        )));
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
                Fields("  Your Nickname", 50.0, 350.0) ]),

              const SizedBox(height: 50),




              Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                PassFields("  Your Password", 50.0, 350.0) ]),

              const SizedBox(height: 80),

              Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                LoginButton("Login", 50.0, 350.0),
              ]),

              const SizedBox(height: 25),

            ]));
  }
}




class Fields extends StatelessWidget {
  final String text;
  double heightt;
  double widthh;
  Fields(this.text, this.heightt, this.widthh);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: heightt,
      width: widthh,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).accentColor, width: 2),
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Align( alignment: Alignment.center,
        child: TextField(

          cursorColor: Colors.deepOrange,
            cursorWidth: 7.0,

            decoration: InputDecoration(
                contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),

                focusedBorder: InputBorder.none,
                hintText: text,
                hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),),
    );
  }
}

class PassFields extends StatelessWidget {

  final String text;
  double heightt;
  double widthh;
  PassFields(this.text, this.heightt, this.widthh);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: heightt,
      width: widthh,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).accentColor, width: 2),
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Align( alignment: Alignment.center,
        child: TextFormField(

            cursorColor: Colors.deepOrange,
            cursorWidth: 7.0,
            obscureText: true,

            decoration: InputDecoration(

                contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: text,
                hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),),
    );
  }
}







class LoginButton extends StatelessWidget {
  final String number;
  double heightt;
  double widthh;

  LoginButton(this.number, this.heightt, this.widthh);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightt,
      width: widthh,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrangeAccent, width: 2),

        borderRadius: const BorderRadius.all(const Radius.circular(15)),
      ),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
          onPressed: () {},
          child: Text(number,
            style: const TextStyle(fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
                fontSize: 25.0,
                fontStyle: FontStyle.normal),
          )),
    );
  }
}



