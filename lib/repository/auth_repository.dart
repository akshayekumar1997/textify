// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:textify/screens/otp_screen.dart';
// import 'package:textify/utils/utils.dart';

// class AuthRepository{
//   final FirebaseAuth auth;
//   final FirebaseFirestore firestore;

//   AuthRepository({required this.auth, required this.firestore});
//   void signInWithPhone(BuildContext context,String phoneNumber)async{
//     try{
// await auth.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credential)async{
//   await auth.signInWithCredential(credential);
// }, 
// verificationFailed: (e){
//   throw Exception(e.toString());
// },
//  codeSent: (String verificationId,int ? resendToken){
  
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) => OTPScreen(verificationId:  
//   verificationId
//   ),));
//  },
//   codeAutoRetrievalTimeout: (String verificationId){

//   });
//     }
//   on FirebaseAuthException  catch(e){
//      showSnack(context: context, title: e.toString()) ;
//     }

//   }
// }