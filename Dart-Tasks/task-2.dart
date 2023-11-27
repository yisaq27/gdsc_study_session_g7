import 'dart:io';

void main() {
  List<int> arr = [];
  print("enter the number of inputs: ");
  int num = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < num; i++) {
    stdout.write("number[$i]=");
    arr.add(int.parse(stdin.readLineSync()!));
  }

  print("The maxmium number =${findMaximum(arr)}");
  print("the minmum number=${findMinimum(arr)}");
  print("sum=${calculateSum(arr)}");
  print("average=${calculateAverage(arr)}");
}

int findMaximum(List<int> number) {
  int largest = 0;
  for (int i = 0; i < number.length; i++) {
    if (number[i] > largest) {
      largest = number[i];
    }
    ;
  }
  return largest;
}

int findMinimum(List<int> number) {
  int min = number[0];
  for (int i = 0; i < number.length; i++) {
    if (number[i] < min) {
      min = number[i];
    }
    ;
  }
  return min;
}

int calculateSum(List<int> number) {
  int sum = 0;
  for (int i = 0; i < number.length; i++) {
    sum += number[i];
  }
  return sum;
}

double calculateAverage(List<int> number) {
  int sum = 0;
  double ave;
  for (int i = 0; i < number.length; i++) {
    sum += number[i];
  }
  ave = sum / number.length;
  return ave;
}
