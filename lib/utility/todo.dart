import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todoList extends StatelessWidget {
  final String TaskName;
  final bool completed;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;

  todoList(
      {super.key,
      required this.TaskName,
      required this.completed,
      required this.onChanged,
      required this.deletefunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
        child: Slidable(
           
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deletefunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12)
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(13)),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Checkbox(
                    value: completed,
                    onChanged: onChanged,
                    activeColor: Colors.deepPurple.shade400),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: (Text(
                    TaskName,
                    style: TextStyle(
                        decoration: completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
