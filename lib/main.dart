import 'package:fire_flutter_app_test/screens/hotels_screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
// import 'add_transaction_screen.dart';
import 'screens/malls_screens/mall_home.dart';
import 'screens/place_screen/place_home.dart';
import 'screens/root_app.dart';
import 'screens/splash_screen.dart';
// import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      // home: SplashScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/rootappscreen',
          page: () => RootApp(),
        ),
        GetPage(
          name: '/placehomescreen',
          page: () => PlaceHomePage(),
        ),
        GetPage(
          name: '/mallhomescreen',
          page: () => MallHomePage(),
        ),
        GetPage(
            name: '/hotelhomescreen',
            page: () => HomePage(),
            transition: Transition.downToUp),
      ],
      initialRoute: '/',
    );
  }
}
