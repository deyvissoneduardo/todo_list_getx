import 'package:flutter/material.dart';

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
