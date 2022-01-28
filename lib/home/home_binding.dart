import 'package:get/instance_manager.dart';
import 'package:prueba_and_lond/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
