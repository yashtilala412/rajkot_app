// import 'dart:convert';
// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'root_app.dart';

// class SignUpPageController extends GetxController {
//   String verificationId = "";
//   String userOtp = "";

//   String? _uid;

//   String get uid => _uid!;

//   var passHide = true.obs;
//   var conPassHide = true.obs;

//   var numberChanged = true.obs;
//   late BuildContext context;

//   TextEditingController fnameController = TextEditingController();
//   TextEditingController lnameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   TextEditingController conPassController = TextEditingController();

//   Rx<PhoneNumber> phoneNumber =
//       PhoneNumber.fromCompleteNumber(completeNumber: "+916351332956").obs;

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore db = FirebaseFirestore.instance;

//   void sendOTPOnPhoneNumber(BuildContext context) async {
//     // log("${phoneNumber.countryCode} ${phoneNumber.number}");

//     try {
//       await _firebaseAuth.verifyPhoneNumber(
//           phoneNumber:
//               "${phoneNumber.value.countryCode}${phoneNumber.value.number}",
//           // phoneNumber: "+44 7444 555666",
//           verificationCompleted:
//               (PhoneAuthCredential phoneAuthCredential) async {
//             // verifyUser(phoneAuthCredential);
//             await _firebaseAuth.signInWithCredential(phoneAuthCredential);
//             EasyLoading.dismiss();
//           },
//           verificationFailed: (error) {
//             EasyLoading.dismiss();
//             // showErrorDialog(context, error.toString());
//             log(error.toString());
//             numberChanged.value = true;
//             showSnackBar(context, "Please check your internet connection");
//             throw Exception(error.message);
//           },
//           codeSent: (verificationId, forceResendingToken) {
//             EasyLoading.dismiss();
//             this.verificationId = verificationId;
//             // showErrorDialog(context, verificationId);
//           },
//           codeAutoRetrievalTimeout: (verificationId) {
//             // showErrorDialog(context, verificationId);
//           });
//     } on FirebaseAuthException catch (e) {
//       // showErrorDialog(context, e.toString());
//       // showSnackBar(context, e.message.toString());
//       numberChanged.value = true;
//       EasyLoading.dismiss();
//       // ignore: use_build_context_synchronously
//       showSnackBar(context, "Please check your internet connection");
//       log(e.toString());
//     }
//     // log(verificationId);
//     // setState(() {});
//   }

//   void verifyUser(PhoneAuthCredential creds) async {
//     try {
//       User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

//       if (user != null) {
//         // log(user.uid);
//         // log(PhoneNumber.fromCompleteNumber(
//         //         completeNumber: user.phoneNumber ?? "")
//         //     .number);
//         // log("${fnameController.text} ${lnameController.text}");
//         // log(user.metadata.toString());

//         String phoneNum =
//             (user.phoneNumber ?? "").replaceAll(RegExp(r'[+\s]'), "");

//         // Hash the password using MD5
//         String hashedPassword =
//             md5.convert(utf8.encode(passController.text)).toString();

//         final userData = <String, String>{
//           "phoneNumber": phoneNum,
//           "firstName": fnameController.text.toUpperCase(),
//           "lastName": lnameController.text.toUpperCase(),
//           "uid": user.uid,
//           "creationTime": user.metadata.creationTime.toString(),
//           "password": hashedPassword, // Store the hashed password
//         };

//         db
//             .doc("/client/$phoneNum")
//             .set(userData, SetOptions(merge: true))
//             .then((_) {
//           SharedPreferences.getInstance().then((prefs) {
//             prefs.setBool('isLogin', true);
//             prefs.setString("phoneNumber", phoneNum);
//             prefs.setString("firstName", fnameController.text.toUpperCase());
//             prefs.setString("lastName", lnameController.text.toUpperCase());
//             prefs.setString("uid", user.uid);
//             prefs.setString(
//                 "creationTime", user.metadata.creationTime.toString());

//             EasyLoading.dismiss();

//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const RootApp(),
//               ),
//               (route) => false, // This will remove all routes from the stack
//             );
//           });
//         }).catchError((e) {
//           EasyLoading.dismiss();
//           log("Error writing document: $e");
//         });
//       }
//     } on FirebaseAuthException catch (e) {
//       // showErrorDialog(context, e.toString());
//       EasyLoading.dismiss();
//       // ignore: use_build_context_synchronously
//       showSnackBar(context, e.message.toString());
//       log(e.toString());
//     }
//   }

//   bool isPasswordValid(String password) {
//     // Password should contain at least 1 uppercase letter, 1 lowercase letter, 1 number,
//     // 1 special character, and have a minimum length of 6 characters.
//     final RegExp passwordRegExp =
//         RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{6,}$');
//     return passwordRegExp.hasMatch(password);
//   }

//   void onSignUpOrSendOTPClick() {
//     if (fnameController.text.isEmpty) {
//       showSnackBar(context, "First Name Required");
//       return;
//     }

//     if (lnameController.text.isEmpty) {
//       showSnackBar(context, "Last Name Required");
//       return;
//     }

//     if (phoneNumber.value.number.isEmpty ||
//         phoneNumber.value.completeNumber == "911234567890") {
//       showSnackBar(context, "Phone Number Required");
//       return;
//     }

//     if (!phoneNumber.value.isValidNumber() ||
//         phoneNumber.value.completeNumber == "911234567890") {
//       showSnackBar(context, "Phone number not valid");
//       return;
//     }

//     if (passController.text.isEmpty) {
//       showSnackBar(context, "Password Required");
//       return;
//     }

//     if (!isPasswordValid(passController.text)) {
//       showSnackBar(context, "Invalid password format");
//       return;
//     }

//     if (conPassController.text.isEmpty) {
//       showSnackBar(context, "Confirm Password Required");
//       return;
//     }

//     if (conPassController.text != passController.text) {
//       showSnackBar(context, "Confirm Password Not Match");
//       return;
//     }

//     if (numberChanged.value) {
//       EasyLoading.show(status: 'Please Wait ...');

//       String phoneNum =
//           phoneNumber.value.completeNumber.replaceAll(RegExp(r'[+\s]'), "");

//       db.doc("/client/$phoneNum").get().then(
//         (DocumentSnapshot doc) {
//           // log("/client/$phoneNum");

//           if (doc.exists) {
//             EasyLoading.dismiss();
//             showSnackBar(context, "Phone Number Already Registered");
//           } else {
//             sendOTPOnPhoneNumber(context);
//             numberChanged.value = false;
//           }
//         },
//         onError: (e) {
//           EasyLoading.dismiss();
//           // sendOTPOnPhoneNumber(context);
//           // numberChanged.value = false;
//           log("Error getting document: $e");
//           showSnackBar(context, "Please check your internet connection");
//         },
//       );
//     } else {
//       if (userOtp.isNotEmpty && userOtp.length == 6) {
//         EasyLoading.show(status: 'Please Wait ...');
//         verifyUser(PhoneAuthProvider.credential(
//             verificationId: verificationId, smsCode: userOtp));
//       } else {
//         showSnackBar(context, "Enter 6-Digit code");
//       }
//     }
//   }
// }
