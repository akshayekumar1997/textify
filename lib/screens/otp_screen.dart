// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class OTPScreen extends StatefulWidget {
//   final String phoneNumber;

//   OTPScreen({required this.phoneNumber});

//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   final TextEditingController _otpController = TextEditingController();
//   late String verificationId;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Get the verification ID from Firebase
//   //   PhoneAuthProvider.verifyPhoneNumber(
//   //     phoneNumber: widget.phoneNumber,
//   //     verificationCompleted: (verificationId) {
//   //       // Save the verification ID
//   //       this.verificationId = verificationId;
//   //     },
//   //     verificationFailed: (error) {
//   //       // Handle the error
//   //       print(error);
//   //     },
//   //     codeSent: (verificationId, forceResendingToken) {
//   //       // The code has been sent to the user's phone
//   //       this.verificationId = verificationId;
//   //     },
//   //     timeout: Duration(seconds: 60),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter OTP'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'OTP'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               child: Text('Submit'),
//               onPressed: () {
//                 // Verify the OTP
//                 PhoneAuthProvider.credential(
//                   verificationId: verificationId,
//                   smsCode: _otpController.text,
//                 ).then((authCredential) {
//                   // Sign in the user with the OTP
//                   FirebaseAuth.instance.signInWithCredential(authCredential);
//                 }).catchError((error) {
//                   // Handle the error
//                   print(error);
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
