import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helpers/constantes.dart';
import '../../../routes/routes.dart';
import '../../controllers/task_controller.dart';
import '../../controllers/textfiled_controller.dart';

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFinalWitdth,
      height: kFinalHeight / 1.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Obx(() {
        return Container(
          margin: const EdgeInsets.all(20),
          child: Get.find<TaskController>().tasks.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Ultima Tarefa',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: kFinalWitdth,
                      height: kFinalHeight / 2,
                      child: Obx(() {
                        return ListView.builder(
                          itemBuilder: (ctx, index) {
                            final task =
                                Get.find<TaskController>().tasks[index];
                            return ListTile(
                              onLongPress: () {
                                Get.defaultDialog(
                                  title: 'Atenção!',
                                  middleText: 'Tem certeza?',
                                  textConfirm: 'Confirmar',
                                  confirmTextColor: Colors.white,
                                  textCancel: 'Cancelar',
                                  onConfirm: () {
                                    Get.find<TaskController>()
                                        .tasks
                                        .removeAt(index);
                                    Get.back();
                                  },
                                  onCancel: () {
                                    Get.back();
                                  },
                                );
                              },
                              onTap: () {
                                Get.find<TaskController>().isEditing = true;
                                Get.find<TaskController>().index = index;
                                Get.find<TextFieldController>()
                                    .taskTitle!
                                    .text = task.title!;
                                //
                                Get.find<TextFieldController>()
                                    .taskSubtitle!
                                    .text = task.subtitle!;
                                //
                                Get.toNamed(Routes.TASKPAGE);
                              },
                              title: Text(
                                task.title ?? '',
                                style: TextStyle(
                                  decoration: task.status ?? false
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: task.status ?? false
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                task.subtitle ?? '',
                                style: TextStyle(
                                  decoration: task.status ?? false
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: task.status ?? false
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              trailing: Checkbox(
                                value: task.status,
                                onChanged: (val) {
                                  task.status = !task.status!;
                                  Get.find<TaskController>().tasks[index] =
                                      task;
                                },
                                activeColor: kLightBlueColor,
                                side: const BorderSide(
                                  color: Colors.black45,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            );
                          },
                          itemCount: Get.find<TaskController>().tasks.length,
                        );
                      }),
                    ),
                  ],
                )
              : const Center(
                  child: Text('Sem Tarefas!'),
                ),
        );
      }),
    );
  }
}
