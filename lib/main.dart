import 'package:final_code/screens/sign_in/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
      MaterialApp(
    home: login(),
    debugShowCheckedModeBanner: false,
  ));
}

