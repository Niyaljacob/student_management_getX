import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manag_getx/common_widgets/delete_dialogues.dart';
import 'package:student_manag_getx/data_base_helper.dart/data_base_helper.dart';
import 'package:student_manag_getx/model/student_model.dart';
import 'package:student_manag_getx/view/edit_student.dart';


class StudentDetailsController extends GetxController {
  
  //AddStudentController data = Get.find();
  late DatabaseHelper db;

  @override
  void onInit() {
    super.onInit();
    db = DatabaseHelper();
  }

 

  void editStudent(Student student) {
    Get.to(() => EditStudentScreen(student: student))?.then((_) => Get.back());
  }

  void showCustomDialog(Student student){
    Get.dialog(DeleteDialog (onCancel: () {
      Get.back();
    },onDelete: () {
      Get.snackbar(
          'Success',
          'Student added successfully',
          messageText: const Text(
            'Student Deleted Successfully',
            style: TextStyle(color: Colors.white),
          ),
          titleText: const Text(
            'Deleted',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.black,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 8,
          isDismissible: true,
        );
        
        db.deleteStudent(student.id);
        Get.until((route) => Get.currentRoute == '/HomePage');
    }));
  }
}
