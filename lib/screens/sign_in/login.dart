
import 'package:final_code/screens/sign_in/components/body.dart';
import 'package:final_code/theme/size_config.dart';
import 'package:flutter/material.dart';



class login extends StatelessWidget {
  static String routeName = "/Login";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

      body: Body(),
      backgroundColor: Colors.white,
    );
  }
}