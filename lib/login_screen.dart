import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// single tern method means only one i can use that method
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobile = TextEditingController();
  TextEditingController _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(
          controller: _mobile,
          decoration: InputDecoration(labelText: "Mobile No"),
        ),
        TextField(
          controller: _otp,
          decoration: InputDecoration(labelText: "OTP"),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Login")),
      ],
    ));
  }
}
