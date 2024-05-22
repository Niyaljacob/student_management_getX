import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_manag_getx/controllers/login_controller.dart';
import 'package:student_manag_getx/core/color.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolo.white, 
      body: Center(
        child:GetBuilder<LoginController>(builder: (loginController){
          return  SizedBox(child: Image.asset('assets/logo_prev_ui.png'));
        },
        )
      ),


    );
  }
}