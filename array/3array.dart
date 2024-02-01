import 'dart:io';

void main() {
  print('Enter the limit of the array');
  int length = int.parse(stdin.readLineSync()!);

  print('Enter the elements in the array');
  List<int> array = [];
  for (int i = 0; i < length; i++) {
    final input = int.parse(stdin.readLineSync()!);
    array.add(input);
  }

  print('Enter by how many place the numbers should rotate');
  int rotations = int.parse(stdin.readLineSync()!);

  if (rotations > 0) {
    List<int> rotatedRight = rotateRight(array, rotations);
    print("Rotated Right: $rotatedRight");
  } else {
    List<int> rotatedLeft = rotateLeft(array, rotations);
    print("Rotated Left: $rotatedLeft");
  }
}




List<T> rotateRight<T>(List<T> inputList, int rotations) {
    rotations %= inputList.length;
    print(rotations);
    return [
      ...inputList.sublist(inputList.length - rotations),
      ...inputList.sublist(0, inputList.length - rotations)
    ];
  }

  List<T> rotateLeft<T>(List<T> inputList, int rotations) {
    rotations %= inputList.length;
    return [
      ...inputList.sublist(rotations),
      ...inputList.sublist(0, rotations)
    ];
  }