import 'package:get/get.dart';

import '../modules/controllers/task_controller.dart';
import '../modules/controllers/textfiled_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.put(TextFieldController());
  }
}
