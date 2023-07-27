import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/task_controller.dart';
import '../../controllers/textfiled_controller.dart';
import '../../../core/helpers/constantes.dart';
import '../../../models/task_model.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      width: kFinalWitdth,
      height: kFinalHeight / 15,
      child: MaterialButton(
        onPressed: () {
          if (Get.find<TaskController>().isEditing) {
            final task = Get.find<TaskController>()
                .tasks[Get.find<TaskController>().index];
            task.title = Get.find<TextFieldController>().taskTitle!.text;
            task.subtitle = Get.find<TextFieldController>().taskSubtitle!.text;
            Get.find<TaskController>().tasks[Get.find<TaskController>().index] =
                task;
          } else {
            Get.find<TaskController>().tasks.add(
                  TaskModel(
                    title: Get.find<TextFieldController>().taskTitle!.text,
                    subtitle:
                        Get.find<TextFieldController>().taskSubtitle!.text,
                    status: false,
                  ),
                );
          }
          Get.back();
        },
        color: kLightBlueColor,
        child: Text(
          Get.find<TaskController>().isEditing ? 'Editar' : 'Criar',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
