import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  
 // final _auth = FirebaseAuth.instance;
 final _firestore =FirebaseFirestore.instance;

     String  email;
     String pass;
     bool loading = false;


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
       body:Stack(
      children: <Widget>[
        Image(
          image: AssetImage("assets/leaf.jpg"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
       SingleChildScrollView(
        
      child:  Padding(
        padding: EdgeInsets.all(40),
      
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min
          ,
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
                  Icons.person,
                  color: Colors.orange,
                ),

                  ),
                  onChanged: (value){
                    setState(() {
                       email=value;
                    });
                       
                  },
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    ),
                    obscureText: true,
                  onChanged: (value){
                    setState(() {
                       pass=value;
                    //   print("this is password $pass ");
                    });
                       
                  },
                ),
                SizedBox(height: 50,),
                    loading  ? Center(child: CircularProgressIndicator()):
                     SizedBox(
                       width: 200.0,
                       height: 50.0,
                       child: OutlineButton(
                         child: Text("sign Up"),
                          borderSide: BorderSide(width: 2.5),
                           shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                         onPressed: () async {
                         setState((){
                         loading = true;
                        });  // set loading to true here
                          await FirebaseAuth.instance.createUserWithEmailAndPassword
                             (email: email, password: pass).then((signInUser) {
                             _firestore.collection('users')
                              .add({'email': email, 'pass': pass,})
                                 .then((value)  {
                                    if(signInUser!=null){
                                       setState((){
                                       loading = false;
                                         });
                         Navigator.pushNamed(context, '/homepage');
                                   }
                                })
                                .catchError((e){
                              print(e);
                          });
                       } 
                     )
                       .catchError((e){
                       print(e);
                   });
                  },

                   ),
                     ),

          
          ],
      ),
       
       
       ),
       ),  
      ],
       ),
      
      
    );
  }
}