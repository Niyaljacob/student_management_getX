import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:student_manag_getx/controllers/home_page_controller.dart';
import 'package:student_manag_getx/core/color.dart';
import 'package:student_manag_getx/core/constance.dart';
import 'package:student_manag_getx/view/student_details_page.dart';

import 'add_student.dart';

class HomePage extends StatelessWidget {
   final HomeController controller = Get.put(HomeController());
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(100),
        child: Container(
        padding:const EdgeInsets.only(top: 25),
          color: Tcolo.primarycolor1,
          child:         
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Student List ',style: titletxt,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    textAlign: TextAlign.start,
                  
                          style:  TextStyle(
                            
                            color: Tcolo.white
                          ),
                          onChanged: (query){
                            controller.filterStudents(query);
                          },
                          decoration: const InputDecoration(
                            
                            contentPadding: EdgeInsets.all(10),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'search students',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            hintStyle: TextStyle(
                              
                color: Colors.white70,
                fontFamily: 'Comfortaa',
                 fontWeight: FontWeight.w300,
                 
                 
                            )
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        return controller.filteredStudents.isEmpty?
         Center(
          child: SizedBox(
            width: 300,
            child: Lottie.asset('assets/Animation - 1716381382165.json')),
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
                      color: index.isEven ? Colors.white : const Color.fromARGB(255, 171, 254, 138),
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
