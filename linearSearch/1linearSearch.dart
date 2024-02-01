import 'dart:io';

void main() {
  // List<int> array = [];

  // print("Enter the Limit of the array");
  // int? limit = int.parse(stdin.readLineSync()!);
  // print('Enter the values into the array');
  // for (int i = 0; i < limit; i++) {
  //   var value = int.parse(stdin.readLineSync()!);
  //   array.add(value);
  // }
  // print("Enter the number to Search the Index");
  // int? number = int.parse(stdin.readLineSync()!);
  // int index = linearSearch(array, number);

  List<int> array = [1, 2, 4, 3, 6, 4, 3];
  int index = linearSearch(array, 6);

  if (index != -1) {
    print("Element found at index: $index");
    List<int> replaced = replace(array, index);
    print(replaced);
  } else {
    print("The Element is not found");
  }
}

int linearSearch(List<int> array, int value) {
  for (int i = 0; i < array.length; i++) {
    if (array[i] == value) {
      return i;
    }
  }
  return -1;
}

List<int> replace(List<int> array, int target) {
  print("Enter the number that you want to replace with");
  int replacing = int.parse(stdin.readLineSync()!);

  array[target] = replacing;

  return array;
}
