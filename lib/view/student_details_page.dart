import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_manag_getx/controllers/student_details_controller.dart';
import 'package:student_manag_getx/core/color.dart';
import 'package:student_manag_getx/core/constance.dart';
import 'package:student_manag_getx/model/student_model.dart';

class StudentDetailspage extends StatelessWidget {
  final StudentDetailsController controller =
      Get.put(StudentDetailsController());
  final Student student;
   StudentDetailspage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolo.primarycolor1,
        title: const Text(
          'Student Profile',
          style: titletxt,
        ),
        actions: [IconButton(
          onPressed: (){
            controller.showCustomDialog(student);
          }, 
          icon: const Icon(Icons.delete),
          ),
          ],
      ),
      body: Column(
        children: [
          kheight,
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(File(student.profilePicture)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kheight,
                  Text(
                    'Name :   ${student.name}',
                    style: contenttxt,
                  ),
                  kheight,
                  Text(
                    'Schoolname :   ${student.schoolname}',
                    style: contenttxt,
                  ),
                  kheight,
                  Text(
                    'Fathername :    ${student.fathername}',
                    style: contenttxt,
                  ),
                  kheight,
                  Text(
                    'Age :                   ${student.age}',
                    style: contenttxt,
                  ),
                  kheight,
                  const SizedBox(
                    width: 63,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
