import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fire_flutter_app_test/screens/root_app.dart'; // Import your RootApp screen
import 'package:fire_flutter_app_test/theme/color.dart';
import 'package:get_storage/get_storage.dart';

import 'take_name.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your mobile number',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColor.textColor,
                ),
              ),
              SizedBox(height: 20),
              MobileNumberInputField(controller: _mobileNumberController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String mobileNumber = _mobileNumberController.text.trim();
                  if (mobileNumber.length < 10) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Invalid Mobile Number'),
                          content: Text('Please enter a valid mobile number.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    print('Valid Mobile Number: $mobileNumber');

                    // Attempting navigation to RootApp using Navigator in the current context
                    final box = GetStorage();
                    box.write("userMobileNo", mobileNumber);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TakeNameScreen()),
                    );
                  }
                },
                child: Text('Get OTP'),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primary,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileNumberInputField extends StatelessWidget {
  final TextEditingController controller;

  const MobileNumberInputField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.textBoxColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: InputDecoration(
          hintText: 'Mobile Number',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.phone_android, color: AppColor.primary),
        ),
        style: TextStyle(color: AppColor.textColor),
      ),
    );
  }
}
