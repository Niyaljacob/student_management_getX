import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_manag_getx/core/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolo.primarycolor1,
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 300,
            child: Lottie.asset('assets/Animation - 1716381382165.json')),
        ),),
      
    );
  }
}
