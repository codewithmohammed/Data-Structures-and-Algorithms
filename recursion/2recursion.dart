import 'dart:io';

void main() {
  print('Enter the limit of the array');
  int? limit = int.parse(stdin.readLineSync()!);
  print('Enter the numbers in the array');
  List<int> numbers = [];
  for (int i = 0; i < limit; i++) {
    var value = int.parse(stdin.readLineSync()!);
    numbers.add(value);
  }

  double result = sum(numbers, numbers.length - 1);
  print('The result of the sum of the numbers in the array is:$result');
}

double sum(List<int> numbers,int index) {
  if (index < 0) {
    return 0;
  } else {
    return numbers[index] + sum(numbers, index - 1);
  }
}