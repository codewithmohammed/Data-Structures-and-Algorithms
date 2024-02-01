

void main() {
  // List<String> array = [];

  // print("Enter the Limit of the array");
  // int? limit = int.parse(stdin.readLineSync()!);
  // print('Enter the values into the array');
  // for (int i = 0; i < limit; i++) {
  //   String value = stdin.readLineSync()!;
  //   array.add(value);
  // }
  // print("Enter the name to Search the index");
  // String? name = stdin.readLineSync()!;
  // String targetName = name;
  // int index = linearSearchforString(array, targetName);

  List<String> array = ["Rayid", "Rasal", "Razi", "David", "Eve"];

  String targetName = "Rasal";

  int index = linearSearchforString(array, targetName);

  if (index != -1) {
    print("Element found at index: $index");
  } else {
    print("The Element is not Found");
  }
}

int linearSearchforString(List<String> array, String targetName) {
  for (int i = 0; i < array.length; i++) {
    if (array[i] == targetName) {
      return i;
    }
  }
  return -1;
}
