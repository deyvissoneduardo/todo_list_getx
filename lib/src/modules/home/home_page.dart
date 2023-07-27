import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/helpers/constantes.dart';
import '../../routes/routes.dart';
import '../controllers/task_controller.dart';
import '../controllers/textfiled_controller.dart';
import 'widgets/bottom_section_widget.dart';
import 'widgets/top_section_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApp.changeNavBarColor(kLightBlueColor, Brightness.light);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: 'hero',
          backgroundColor: kLightBlueColor,
          elevation: 1,
          tooltip: 'Criar Tarefa',
          onPressed: () {
            Get.find<TaskController>().isEditing = false;
            Get.find<TextFieldController>().taskTitle!.text = '';
            Get.find<TextFieldController>().taskSubtitle!.text = '';
            Get.toNamed(Routes.TASKPAGE)!.then((value) {
              return MyApp.changeNavBarColor(kLightBlueColor, Brightness.light);
            });
          },
          child: const Icon(Icons.add),
        ),
        body: const Stack(
          alignment: Alignment.bottomCenter,
          children: [
            TopSectionWidget(),
            BottomSectionWidget(),
          ],
        ),
      ),
    );
  }
}
