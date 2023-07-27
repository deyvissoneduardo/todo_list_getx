import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../controllers/task_controller.dart';
import '../controllers/textfiled_controller.dart';
import '../core/helpers/constantes.dart';
import '../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApp.changeNavBarColor(kLightBlueColor, Brightness.light);
    return const SafeArea(
      child: Scaffold(
        floatingActionButton: MyFloatingActionButton(),
        body: Stack(
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

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}

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

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFinalWitdth,
      color: kLightBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tooltip(
                  message: 'More',
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Tooltip(
                      message: 'Deletar Todas Tarefas',
                      child: IconButton(
                        onPressed: () {
                          Get.find<TaskController>().tasks.value = [];
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tooltip(
                      message: 'Perfil',
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 40.0, top: 40.0),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Center(
                child: Icon(
                  Icons.paste_rounded,
                  color: kLightBlueColor,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 48.0, top: 12.0),
            child: const Text(
              'Todas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 47.0,
            ),
            child: Obx(() {
              return Text(
                '${Get.find<TaskController>().tasks.length} Tarefas',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
