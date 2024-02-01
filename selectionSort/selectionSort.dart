void main() {
  List<int> array = [5, 1, 4, 2, 8, 3];
  List<int> sortedarray = selectionSort(array);

  print(sortedarray);
}

List<int> selectionSort(List<int> array) {
  for (int i = 0; i < array.length - 1; i++) {
    int min = i;
    for (int j = i + 1; j < array.length; j++) {
      if (array[min] > array[j]) {
        min = j;
      }
    }
    int temp = array[i];
    array[i] = array[min];
    array[min] = temp;
  }
  return array;
}
