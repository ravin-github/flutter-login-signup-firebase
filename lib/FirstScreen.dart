import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
              child: Container(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                
             children: [
               FlutterLogo(size: 200,),
               SizedBox(height: 100,),
                Text("Siccessfull SignUP Press Button to go back on Login.."),
                OutlineButton(
                  child: new Text("Log Out"),
                   onPressed: (){
                     FirebaseAuth.instance.signOut().then((value){
                         Navigator.pushNamed(context, '/backtologin');
                     }).catchError((e){
                       print(e);
                     });
                 
                   },
                  
                   shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                     ),
             ],
    ),
          
        ),
      ),
    );
  }
}
