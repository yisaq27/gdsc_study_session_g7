import 'dart:async';
import 'dart:io';

Future<void> main() async {
  int x;
  int y;
  int? choice;
  stdout.write("enter x numbers: ");
  x = int.parse(stdin.readLineSync()!);
  stdout.write("enter y numbers: ");
  y = int.parse(stdin.readLineSync()!);
  calculator boo = new calculator();
  print(
      "what do you want\n1) addition\n2) subtraction\n3) multipication\n4) division");
  choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      print("Please Wait ....");
      Future.delayed(Duration(seconds: 5), () {
        print("addition= ${boo.addition(x, y)}");
      });
      break;
    case 2:
      print("Please Wait ....");
      Future.delayed(Duration(seconds: 5), () {
        print("subtraction= ${boo.subtraction(x, y)}");
      });
      break;
    case 3:
      print("Please Wait ....");
      Future.delayed(Duration(seconds: 5), () {
        print("multiplication= ${boo.multiplication(x, y)}");
      });
      break;
    case 4:
      print("Please Wait ....");
      Future.delayed(Duration(seconds: 5), () {
        print("divison= ${boo.division(x, y)}");
      });
      break;
  }
}

class calculator {
  int addition(int x, int y) {
    return x + y;
  }

  int subtraction(int x, int y) {
    return x - y;
  }

  int multiplication(int x, int y) {
    return x * y;
  }

  double? division(int x, int y) {
    try {
      if (y == 0) throw Exception("Divisor can't be zero");
      return x / y;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
