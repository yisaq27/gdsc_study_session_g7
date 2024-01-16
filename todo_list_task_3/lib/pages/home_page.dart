import 'package:flutter/material.dart';
import 'package:todo_list_task_3/pages/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(235, 236, 93, 26),
        body: Column(
          children: [
            Container(
              width: 400,
              color: Colors.transparent,
              child: Image.asset('assets/images/stickman.png'),
            ),
            const SizedBox(
              height: 120,
            ),
            //Elevated button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => SecondPage(),
                    ),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
