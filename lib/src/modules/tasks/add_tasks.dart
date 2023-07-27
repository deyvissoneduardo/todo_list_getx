import 'package:flutter/material.dart';

import '../../../main.dart';
import 'widgets/add_button_widget.dart';
import 'widgets/add_note_text_field_widget.dart';
import 'widgets/custom_bar_app.dart';
import 'widgets/task_text_filed_widget.dart';
import 'widgets/title_widget.dart';

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
            CustomAppBar(),
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
