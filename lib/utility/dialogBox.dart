import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
   DialogBox({super.key, required this.controller,required this.onSave  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "add Task",
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Button(
              text: 'Valide',
              onPressed: onSave,
            )
          ])
        ]),
      ),
    );
  }
}
