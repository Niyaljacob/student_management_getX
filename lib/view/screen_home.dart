import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:student_manag_getx/controllers/home_page_controller.dart';
import 'package:student_manag_getx/core/color.dart';
import 'package:student_manag_getx/view/student_details_page.dart';

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
      body: Obx(() {
        return controller.filteredStudents.isEmpty?
         Center(
          child: SizedBox(
            width: 300,
            child: Lottie.asset('assets/no data found.json')),
          // child:
          //  Text('No Data Found.'
          
          // ,
          // style: TextStyle(
          //   fontWeight: FontWeight.w600,
          //   letterSpacing: 4,
          //   wordSpacing: 5
          // ),),
        )
        :Column(
          children: [
            
            Expanded(
              child: ListView.builder(
                itemCount: controller.filteredStudents.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final student = controller.filteredStudents[index];
                  return GestureDetector(
                    onTap: () {
              Get.to(StudentDetailspage(student: student))?.then((value) => controller.refreshStudentList());
                    },
                    child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: FileImage(File(student.profilePicture)),
                ),
                title: Text(
                  student.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
               subtitle:Text(student.schoolname),
               trailing: Text('age:${student.age.toString()}'),
              ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
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
