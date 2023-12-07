import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatefulWidget {
  final String contact;

  OtpScreen({required this.contact});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String smsOTP;
  late String verificationId;
  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    generateOtp(widget.contact);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel(); // Dispose of timer if necessary
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: screenWidth * 0.7,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Image.asset(
                  'assets/images/varification.png',
                  height: screenHeight * 0.3,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  'Enter a 6-digit number that was sent to ${widget.contact}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                OTPEntryWidget(
                  onOTPEntered: (otp) {
                    smsOTP = otp;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    verifyOtp();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 253, 188, 51),
                      borderRadius: BorderRadius.circular(36),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Verify',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> generateOtp(String contact) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      verificationId = verId;
    };

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: contact,
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
        },
        codeSent: smsOTPSent,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException exception) {
          handleError(exception as PlatformException);
        },
      );
    } catch (e) {
      handleError(e as PlatformException);
    }
  }

  Future<void> verifyOtp() async {
    if (smsOTP.isEmpty || smsOTP.length != 6) {
      showAlertDialog(context, 'Please enter a valid 6-digit OTP');
      return;
    }

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final UserCredential user = await _auth.signInWithCredential(credential);
      final User? currentUser = _auth.currentUser;
      assert(user.user!.uid == currentUser!.uid);
      Navigator.pushReplacementNamed(context, '/homeScreen');
    } catch (e) {
      handleError(e as PlatformException);
    }
  }

  void handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        setState(() {
          errorMessage = 'Invalid Code';
        });
        showAlertDialog(context, 'Invalid Code');
        break;
      default:
        showAlertDialog(context, error.message ?? 'An error occurred');
        break;
    }
  }

  void showAlertDialog(BuildContext context, String message) {
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class OTPEntryWidget extends StatefulWidget {
  final Function(String) onOTPEntered;

  OTPEntryWidget({required this.onOTPEntered});

  @override
  _OTPEntryWidgetState createState() => _OTPEntryWidgetState();
}

class _OTPEntryWidgetState extends State<OTPEntryWidget> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          6,
          (index) => SizedBox(
            width: 40,
            height: 40,
            child: TextFormField(
              controller: _controllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
                if (_isAllFilled()) {
                  String otp =
                      _controllers.map((controller) => controller.text).join();
                  widget.onOTPEntered(otp);
                }
              },
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isAllFilled() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }
}
