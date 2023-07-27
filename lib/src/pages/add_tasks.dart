import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../controllers/task_controller.dart';
import '../controllers/textfiled_controller.dart';
import '../core/helpers/constantes.dart';
import '../models/task_model.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApp.changeNavBarColor(const Color(0xfff5f5f5), Brightness.light);
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCustomAppBar(),
            TitleWidget(),
            TaskTextFiledWidget(),
            AddNoteTextFieldWidget(),
            AddButtonWidget(),
          ],
        ),
      ),
    );
  }
}

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
            // Editing
            final task = Get.find<TaskController>()
                .tasks[Get.find<TaskController>().index];
            task.title = Get.find<TextFieldController>().taskTitle!.text;

            ///=====
            task.subtitle = Get.find<TextFieldController>().taskSubtitle!.text;

            ///====
            Get.find<TaskController>().tasks[Get.find<TaskController>().index] =
                task;
          } else {
            // Adding
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

class AddNoteTextFieldWidget extends StatelessWidget {
  const AddNoteTextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: TextField(
        controller: Get.find<TextFieldController>().taskSubtitle,
        maxLength: 30,
        cursorColor: kLightBlueColor,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.bookmark_border, color: Colors.grey),
          border: InputBorder.none,
          counter: Container(),
          hintText: 'Adicionar Nota',
          hintStyle: const TextStyle(fontSize: 16, height: 1.3),
        ),
      ),
    );
  }
}

class TaskTextFiledWidget extends StatelessWidget {
  const TaskTextFiledWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: Get.find<TextFieldController>().taskTitle,
        maxLines: 6,
        cursorColor: kLightBlueColor,
        cursorHeight: 40,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10),
      child: const Text(
        'O que esta planejando?',
        style: TextStyle(color: Colors.grey, fontSize: 17),
      ),
    );
  }
}

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 40.0),
            child: Text(
              Get.find<TaskController>().isEditing
                  ? 'Editar Tarefa'
                  : 'Nova Tarefa',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
          ),
        ),
        Hero(
          tag: 'hero',
          child: Material(
            color: const Color(0xfff5f5f5),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        )
      ],
    );
  }
}
