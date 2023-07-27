import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/task_controller.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
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
