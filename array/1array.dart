import 'dart:io';

void main() {
  print('Enter the limit of the arrays');
  int length = int.parse(stdin.readLineSync()!);

  print('Enter the elements in the first array');
  List<int> array1 = [];
  for (int i = 0; i < length; i++) {
    final input = int.parse(stdin.readLineSync()!);
    array1.add(input);
  }

  print('Enter the elements in the second array');
  List<int> array2 = [];
  for (int i = 0; i < length; i++) {
    final input = int.parse(stdin.readLineSync()!);
    array2.add(input);
  }

  List<int> result = [];
  for (int i = 0; i < length; i++) {
    for (int j = 0; j < length; j++) {
      if (array1[i] == array2[j]) {
        result.add(array1[i]);
      }
    }
  }

  print('Common Elements: ${result.toSet()}');
}
