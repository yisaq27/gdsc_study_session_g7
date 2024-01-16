import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_task_3/TodoList.dart';
import 'package:todo_list_task_3/pages/animation_page.dart';
import 'package:todo_list_task_3/pages/second_page.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

class TodoFormProvider extends ChangeNotifier {
  late String title;
  late String desc;
  late String date = '';

  void dateFormatter(DateTime? newDate) {
    date = Jiffy.parse(newDate.toString()).format(pattern: 'yMMMMd');
    notifyListeners();
  }

  void saveTask() {
    todoLists.add(TodoList(title: title, desc: desc, dateTime: date));
    title = '';
    desc = '';
    date = '';

    notifyListeners();
  }
}

class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final String title1;
  late final String desc1;
  late final DateTime? date1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
          ),
          style: IconButton.styleFrom(foregroundColor: Colors.amber[800]),
        ),
        title: const Text(
          'Create new task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child:
            Consumer<TodoFormProvider>(builder: (context, todoFormProvider, _) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Lottie.asset('assets/animations/animations.json',
                          repeat: true,
                          fit: BoxFit.fill,
                          width: 300,
                          height: 300)),
                  const Text(
                    'Main task name',
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 98, 52),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _formTextField(expression: "Title", fieldType: "title"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Due date',
                    style: TextStyle(
                        color: Color.fromARGB(255, 248, 98, 52),
                        fontWeight: FontWeight.bold),
                  ),
                  Card(
                    elevation: 5,
                    surfaceTintColor: Colors.white,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: Provider.of<TodoFormProvider>(context,
                                    listen: false)
                                .date
                                .isEmpty
                            ? "Due Date"
                            : Provider.of<TodoFormProvider>(context,
                                    listen: false)
                                .date,
                        contentPadding: const EdgeInsets.all(15),
                        border: InputBorder.none,
                      ),
                      onTap: () async {
                        date1 = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        );

                        // ignore: use_build_context_synchronously
                        Provider.of<TodoFormProvider>(context, listen: false)
                            .dateFormatter(date1);
                      },
                      validator: (value) {
                        if (Provider.of<TodoFormProvider>(context,
                                listen: false)
                            .date
                            .isEmpty) {
                          return "Date is required";
                        }
                        value = 'date is now not empty';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 98, 52),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _formTextField(
                    expression: "Task Description",
                    fieldType: "desc",
                  ),
                  const SizedBox(height: 60),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 40),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 248, 98, 52),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (kDebugMode) {
                                print('am  in the validator function...');
                              }

                              Provider.of<TodoFormProvider>(context,
                                      listen: false)
                                  .title = title1;
                              Provider.of<TodoFormProvider>(context,
                                      listen: false)
                                  .desc = desc1;
                              Provider.of<TodoFormProvider>(context,
                                      listen: false)
                                  .saveTask();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (contex) => SecondPage(),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Add task',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 40),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 9, 132, 247),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AnimationPage()));
                          },
                          child: const Text(
                            'View Animation',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _formTextField({String expression = "", String fieldType = ""}) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: TextFormField(
          decoration: InputDecoration(
            hintText: expression,
            contentPadding: const EdgeInsets.all(15),
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "$expression can't be empty";
            }
            return null;
          },
          onSaved: (value) {
            if (fieldType.contains("title")) {
              title1 = value!;
            } else if (fieldType.contains("desc")) {
              desc1 = value!;
            }
          }),
    );
  }
}
