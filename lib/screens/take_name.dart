import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/fire_base_service.dart';
import '../theme/color.dart';
import 'root_app.dart';

class TakeNameScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final box = GetStorage();
  // String mobileNo = box.read('userMobileNo');
  String get mobileNo => box.read('userMobileNo') ?? "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextField(
              //   controller: nameController,
              //   decoration: InputDecoration(labelText: 'Name'),
              // ),
              maketextField(nameController, "Name"),
              SizedBox(height: 20),
              maketextField(surnameController, "Surname"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String surname = surnameController.text;
                  box.write("islogged", true);
                  // String opt = FirebaseOperations.addUserData(mobileNo,
                  //     nameController.text.toString(), surname.toString());
                  // FirebaseOperations.addTransaction();
                  nameController.clear();
                  surnameController.clear();
                  // print(opt);
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => RootApp()),
                  // );
                  Get.offAll(RootApp());
                },
                child: Text('Next'),
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

  Widget maketextField(TextEditingController controller, String hinttext) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.textBoxColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          border: InputBorder.none,
        ),
        style: TextStyle(color: AppColor.textColor),
      ),
    );
  }
}
