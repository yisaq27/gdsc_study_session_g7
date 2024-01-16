import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 33),
      appBar: AppBar(
        title: const Text(
          'Animation Page',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 4,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 34, 34, 33),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
          ),
          style: IconButton.styleFrom(foregroundColor: Colors.amber[800]),
        ),
      ),
      body: Center(
          child: Lottie.asset('assets/animations/animations.json',
              repeat: true, fit: BoxFit.cover)),
    );
  }
}
