import 'dart:io';

void main() {
  print('Enter the number to find the factorial of the number');

  int? number = int.parse(stdin.readLineSync()!);

  double? result = factorial(number);
  print('The Factorial of the number is :$result');
}

double factorial(int number) {
  if (number == 0) {
    return 1;
  } else {
    return number * factorial(number - 1);
  }
}
