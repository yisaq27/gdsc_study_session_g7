
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_task_3/TodoList.dart';
import 'package:todo_list_task_3/pages/fourth_page.dart';
import 'package:todo_list_task_3/pages/third_page.dart';

class TodoListProvider extends ChangeNotifier {
  List<Color?> color = [
    Colors.red[400],
    Colors.green[400],
    Colors.orange[400],
    Colors.blue[400],
    Colors.pink,
    Colors.purple[700],
    Colors.black,
  ];

  int colorIndex = 0;

  void removeTodoItem(int index) {
    todoLists.removeAt(index);
    notifyListeners();
  }

  int getIncrement() {
    colorIndex = colorIndex == 7 ? 0 : colorIndex;
    return colorIndex++;
  }
}

class TodoItem {
  final String title;
  final String desc;
  final String dateTime;

  TodoItem(this.title, this.desc, this.dateTime);
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  // final List<String> _toDoLists = [
  final List<Color?> color = [
    Colors.red[400],
    Colors.green[400],
    Colors.orange[400],
    Colors.blue[400],
    Colors.pink,
    Colors.purple[700],
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          style: IconButton.styleFrom(foregroundColor: Colors.amber[800]),
        ),
        title: const Text('Todo List'),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 60),
            child: Image.asset('assets/images/stickman-1.png'),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              "Task Lists",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(child: _listBuilder()),
          Padding(
            padding: EdgeInsets.only(bottom: todoLists.length < 6 ? 100 : 0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 238, 98, 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => ThirdPage(),
                    ),
                  );
                },
                child: const Text(
                  'Create Task',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listBuilder() {
    return Consumer<TodoListProvider>(
      builder: (context, todoProvider, _) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemExtent: 70,
        cacheExtent: 0,
        itemCount: todoLists.length,
        itemBuilder: (BuildContext context, int index) {
          todoProvider.colorIndex =
              todoProvider.colorIndex == 7 ? 0 : todoProvider.colorIndex;

          return Padding(
            padding: const EdgeInsets.only(left: 6, top: 3, right: 6),
            child: Dismissible(
              key: Key(todoLists[index].title),
              direction: DismissDirection.endToStart,
              background: const Card(
                elevation: 7,
                color: Colors.red,
                child: Icon(Icons.delete),
              ),
              onDismissed: (direction) {
                todoProvider.removeTodoItem(index);
              },
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 4,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) {
                          return FourthPage(
                            title: todoLists[index].title,
                            description: todoLists[index].desc,
                            deadLine: todoLists[index].dateTime,
                          );
                        },
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                    child: Text(
                      todoLists[index].title[0],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                  title: Text(
                    todoLists[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  trailing: SizedBox(
                    width: 125,
                    height: 45,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(todoLists[index].dateTime),
                        const Spacer(),
                        Container(
                          color: color[Provider.of<TodoListProvider>(context)
                              .getIncrement()],
                          width: 7,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
