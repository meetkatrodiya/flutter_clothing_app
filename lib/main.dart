import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clothing_app_11/screens/login_screen.dart';

import 'package:flutter_clothing_app_11/pages/main/ui/index.dart';
import 'package:flutter_clothing_app_11/routes/pages.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// void main(){
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Email and Password Login',
  //     theme: ThemeData(

  //       primarySwatch: Colors.red,
  //     ),
  //     home: LoginScreen(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
    );
  }
}
