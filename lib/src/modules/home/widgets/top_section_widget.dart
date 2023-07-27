import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helpers/constantes.dart';
import '../../controllers/task_controller.dart';

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
