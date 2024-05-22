import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:student_manag_getx/view/screen_home.dart';

class LoginController extends GetxController{
  @override
  void onInit() {
  
    super.onInit();
    gotoLogin();
  }
   Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll( HomePage());
  }
}