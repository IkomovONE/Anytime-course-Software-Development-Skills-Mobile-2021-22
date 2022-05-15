import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  setCredentials createState() => setCredentials();

}

class setCredentials extends State {

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



    return GestureDetector(
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
            preferredSize: const Size.fromHeight(45.0),
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
                          label: const Text("Back", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20, fontWeight: FontWeight.bold,),),

                          style: ElevatedButton.styleFrom(
                              elevation: 0, primary: Colors.transparent),
                        )
                    )))),
        backgroundColor: Colors.black12,
        //the appBar back button is taken from "https://www.kindacode.com/snippet/flutter-creating-custom-back-buttons/"




      body: Center(

    child: Column(


          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,


          children: <Widget>[



            Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
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

              onChanged: (name) {

                SetNickname(name);


              },

              cursorColor: Colors.deepOrange,
              cursorWidth: 7.0,



              decoration: const InputDecoration(
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),

                  focusedBorder: InputBorder.none,
                  hintText: "New Nickname",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),),
      ), ]),

            const SizedBox(height: 50),



        Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
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
                        hintText: "New Password",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 20.0, fontStyle: FontStyle.normal)),),
            ),],),

            const SizedBox(height: 80),




            Container(
              height: 50,
              width: 350,

              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrangeAccent, width: 2),

                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {

                    Auth().Register(nickname: nickname, password: password);
                  },
                  child: const Text("Register",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                        fontSize: 25.0,
                        fontStyle: FontStyle.normal),
                  )),
            )







      ],
      ),)),






    ),);



  }

}


class Auth {

  Future<String> Register({required String nickname, required String password}) async{

    late final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
    try{



      _firebaseAuth.createUserWithEmailAndPassword(email: nickname, password: password);

      return "Signed in";
    }
    on FirebaseAuthException catch (e) {
      return "Error";
    }
  }
}