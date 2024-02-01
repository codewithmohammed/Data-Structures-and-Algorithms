
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
  int index = linearSearch(array, 1);

  if (index != -1) {
    print("Element found at index: $index");
  } else {
    print("The Element is not Sound");
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


