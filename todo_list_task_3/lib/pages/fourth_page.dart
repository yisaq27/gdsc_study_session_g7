import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage(
      {super.key,
      required this.title,
      required this.description,
      required this.deadLine});
  final String title;
  final String description;
  final String deadLine;

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
        title: const Text('Task Detail'),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/shopping-1.png'),
            const Text('Title'),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 223, 219, 219),
              ),
              width: 300,
              child: Text(title),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text('Description'),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 223, 219, 219),
                ),
                padding: const EdgeInsets.all(10),
                width: 300,
                height: 120,
                child: SingleChildScrollView(
                  child: Text(description),
                )),
            const SizedBox(
              height: 17,
            ),
            const Text('Deadline'),
            Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 223, 219, 219),
              ),
              child: Text(deadLine),
            ),
          ],
        ),
      ),
    );
  }
}
