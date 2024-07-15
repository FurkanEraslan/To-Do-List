import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  //Passing function as paramater
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType taskType = TaskType.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Task'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Category"),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Category selected"),
                        ),
                      );
                      setState(() {
                        taskType = TaskType.note;
                      });
                    },
                    child: const Icon(
                      Icons.sports_esports_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Text("Category"),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Category selected"),
                        ),
                      );
                      setState(() {
                        taskType = TaskType.calendar;
                      });
                    },
                    child: const Icon(
                      Icons.work,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Text("Category"),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text("Category selected"),
                        ),
                      );
                      setState(() {
                        taskType = TaskType.contest;
                      });
                    },
                    child: const Icon(
                      Icons.school,
                      size: 50,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        const Text("Date"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: dateController,
                            decoration: const InputDecoration(
                                filled: true, fillColor: Colors.white),
                          ),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        const Text("Time"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: timeController,
                            decoration: const InputDecoration(
                                filled: true, fillColor: Colors.white),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Description"),
              ),
              SizedBox(
                height: 300,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Task newtask = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      isCompleted: false,
                      type: taskType);
                  widget.addNewTask(newtask);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white, 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//todo_app\lib\screens\add_new_task.dart