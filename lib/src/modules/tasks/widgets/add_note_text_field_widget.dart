import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/textfiled_controller.dart';
import '../../../core/helpers/constantes.dart';

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
