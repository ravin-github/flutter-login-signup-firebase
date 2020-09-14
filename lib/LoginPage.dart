// ignore: unused_import
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/FirstScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
     // final _auth = FirebaseAuth.instance;

   String  email;
     String pass;

    bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Login"),
        // ),  
      body:Stack(
      children: <Widget>[
        Image(
          image: AssetImage("assets/newbg.jpg"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      SingleChildScrollView(

     child:  Padding(padding: EdgeInsets.symmetric(vertical: 70,horizontal: 40),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             FlutterLogo(size: 140,),
               SizedBox(height:10,),
            TextField(
                   decoration: InputDecoration(
                    border:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0),
                      
                      ),
                    labelText: "email",
                     prefixIcon: const Icon(
                  Icons.person_add_alt_1_outlined,
                  color: Colors.orange,
                ),

                  ),
                  onChanged: (value){
                    setState(() {
                       email=value;
                    });
                       
                  },
                ),
                SizedBox(height: 20.0,),
                TextField(
                   decoration: InputDecoration(
                    border:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0),
                      
                      ),
                    labelText: "Password",
                     prefixIcon: const Icon(
                  Icons.vpn_key_outlined,
                  color: Colors.orange,
                ),

                  ),
                  onChanged: (value){
                    setState(() {
                       pass=value;
                    });
                       
                  },
                ),
                SizedBox(height: 40,),
                loading ? Center(child: CircularProgressIndicator()):
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(
                      width: 160.0,
                       height: 40.0,
                      child: Container(
                         decoration: BoxDecoration(
                        color: Colors.black,
                                  borderRadius: BorderRadius.circular(30.0),
                            ),
                                child: OutlineButton(
                                onPressed: (){
                                 setState(() {
                                  loading = true;
                                 });
                                try {
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email, password: pass)
                              .then((signOutUser) {
                                setState(() {
                                  loading = false;
                                });
                                Navigator.pushNamed(context, '/homepage');
                                  } ).catchError((e){
                                print(e);
                              });
                                } catch (e)
                                 {
                                  print(e);
                               }
                             
                             }, 
                          child: Text("sign in"),
                          borderSide: BorderSide(width: 2.5,color: Colors.yellowAccent),
                          highlightedBorderColor: Colors.black,
                          highlightColor: Colors.white,
                          textColor: Colors.yellow,
                           shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                                 ),
                      ),
                    ),
                  
                
                 SizedBox(width: 10,),
                SizedBox(
                  width: 110.0,
                  height: 40.0,
                  child: Container(
                     decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(30.0),
                         ),
                    child: OutlineButton(onPressed: (){
                      
                      Navigator.pushNamed(context, '/signup');
                    }, child: Text("sign Up"),
                    color: Colors.orange,
                    highlightColor: Colors.white,
                     highlightedBorderColor: Colors.black,
                    
                     borderSide: BorderSide(width:2.5,color: Colors.black),

                       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ),
                ),
                   ],
                ),
          
          ],
      ),
      
      
      ),
      ),
       
      // body: Container(
      //   color: Colors.white,
      //   child: Center(
      //     child: Column(
      //       // mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         FlutterLogo(size: 150),
      //         SizedBox(height: 50),
      //          Column(
      //          mainAxisAlignment: MainAxisAlignment.center,
      //          children: [
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: "email",

                //   ),
                //   onChanged: (vlue){
                //     setState(() {
                //        _email=value;
                //     });
                       
                //   },
                // ),
      //           TextField(
      //             decoration: InputDecoration(
      //               labelText: "email",
      //             ),
      //             onChanged: (vlue){
      //               setState(() {
      //                  pass=value;
      //               });
      //             },
      //           ),
      //           FlatButton(onPressed: (){}, child: Text("sign in"),)

      //          ],
      //        ),
      //         // _signInButton(),
      //       ],
      //     ),
      //   ),
      // ),
      ],
      ),
    );
  }

  // Widget _signInButton() {
  //           return OutlineButton(
  //     splashColor: Colors.grey,
  //    onPressed: () {
  //        signInWithGoogle().then((result) {
  //       if (result != null) {
  //         Navigator.of(context).push(
  //            MaterialPageRoute(
  //            builder: (context) {
  //            return FirstScreen();
  //                  },
  //                ),
  //              );
  //            }
  //           });
  //         },
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  //     highlightElevation: 0,
  //     borderSide: BorderSide(color: Colors.grey),
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10),
  //             child: Text(
  //               'Sign in with Google',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );




  // }
}