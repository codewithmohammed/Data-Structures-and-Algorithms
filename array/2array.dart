import 'dart:io';

void main() {
  print('Enter the number of rows in the arrays');
  int row = int.parse(stdin.readLineSync()!);
  print('Enter the number of columns in the arrays');
  int column = int.parse(stdin.readLineSync()!);

  List<List<int>> array1 = [];

  for (int i = 0; i < row; i++) {
    array1.add([]);
  }

  print('Enter the elements in the array');

  for (int i = 0; i < row; i++) {
    print('Enter elements for row $i:');
    for (int j = 0; j < column; j++) {
      final input = int.parse(stdin.readLineSync()!);
      array1[i].add(input);
    }
  }

  print(array1);

  List<List<int>> transposedArray = transposeMatrix(array1, row, column);
  print('\nTransposed Matrix:');
  for (List<int> row in transposedArray) {
    print(row);
  }
}

List<List<int>> transposeMatrix(List<List<int>> matrix, int rows, int columns) {
  List<List<int>> result = [];

  for (int j = 0; j < columns; j++) {
    result.add(List<int>.generate(rows, (i) => matrix[i][j]));
  }
  return result;
}
