import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:student_manag_getx/controllers/home_page_controller.dart';
import 'package:student_manag_getx/core/color.dart';

import 'add_student.dart';

class HomePage extends StatelessWidget {
   final HomeController controller = Get.put(HomeController());
   HomePage({super.key});

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
        ),
        ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddStudentScreen())!
              .then((value) => controller.refreshStudentList());
        },
        backgroundColor: Tcolo.primarycolor1,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      
    );
  }
}
