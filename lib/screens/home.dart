import 'package:flutter/material.dart';
import 'package:todo_app/cart-item.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/screens/login_page.dart';
import 'package:todo_app/service/todo_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
        title: "Study lesson",
        description: "description",
        isCompleted: false,
        type: TaskType.note),
    Task(
        title: "Study lesson",
        description: "description",
        isCompleted: false,
        type: TaskType.note),
    Task(
        title: "Study lesson",
        description: "description",
        isCompleted: false,
        type: TaskType.note)
  ];

  List<Task> completed = [
    Task(
        title: "Study lesson",
        description: "description",
        isCompleted: false,
        type: TaskType.note),
    Task(
        title: "Study lesson",
        description: "description",
        isCompleted: false,
        type: TaskType.note),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('To-Do List'),
            actions: [
              IconButton(
                onPressed: _logout,
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Uncompleted",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getUncompletedTodos(),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              return TodoItem(
                                task: snapshot.data![index],
                              );
                            }),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getCompletedTodos(),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              return TodoItem(
                                task: snapshot.data![index],
                              );
                            }),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewTaskScreen(
                    addNewTask: (newTask) => addNewTask(newTask),
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
