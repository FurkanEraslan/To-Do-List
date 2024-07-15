import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Todo task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(
                      decoration: widget.task.completed!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "User :" + widget.task.userId!.toString(),
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(
                value: isCheck,
                onChanged: (val) => {
                      setState(() {
                        widget.task.completed = !widget.task.completed!;
                        isCheck = val!;
                      })
                    }),
          ],
        ),
      ),
    );
  }
}
