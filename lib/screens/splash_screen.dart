import 'package:flutter/material.dart';
// import 'package:fire_flutter_app_test/screens/root_app.dart';
import 'package:fire_flutter_app_test/theme/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'mobile_no_input.dart';
import 'root_app.dart';
// Import the screen you want to navigate to

class SplashScreen extends StatelessWidget {
  final box = GetStorage();
  bool get islogged => box.read('islogged') ?? false;
  // bool islogged = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (islogged == true) {
        Get.offAll(RootApp());
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OTPScreen()), // Replace NewScreen() with your screen widget
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rajkot App',
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
