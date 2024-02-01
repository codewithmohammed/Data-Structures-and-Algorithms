void main() {
  List<int> array = [2, 3, 5, 1, 6, 4];

  int high = array.length - 1;
  int low = 0;

  List<int> mergeResult = sortMerge(array);
  print(mergeResult);

  List<int> result = sortQuick(array, low, high);
  // print(result);
}

List<int> sortMerge(List<int> array) {
  if (array.length <= 1) {
    return array;
  }
  int split = array.length ~/ 2;
  List<int> leftArray = sortMerge(array.sublist(0, split));
  List<int> rightArray = sortMerge(array.sublist(split));

  List<int> result = lrMerge(leftArray, rightArray);

  return result;
}

List<int> lrMerge(List<int> leftArray, List<int> rightArray) {
  List<int> result = [];
  int i = 0;
  int j = 0;

  while (i < leftArray.length && j < rightArray.length) {
    if (leftArray[i] < rightArray[j]) {
      result.add(leftArray[i]);
      i++;
    } else {
      result.add(rightArray[j]);
      j++;
    }
  }

  while (j < rightArray.length) {
    result.add(rightArray[j]);
    j++;
  }

  while (i < leftArray.length) {
    result.add(leftArray[i]);
    i++;
  }

  return result;
}

List<int> sortQuick(List<int> array, int low, int high) {
  if (low < high) {
    int pi = quickPartition(array, low, high);
    sortQuick(array, low, pi - 1);
    sortQuick(array, pi + 1, high);
  }
  return array;
}

int quickPartition(List<int> array, int low, int high) {
  if (array.isEmpty) {
    return 0;
  }
  int pivot = array[high];
  int i = low - 1;
  for (int j = low; j < array.length; j++) {
    if (array[j] < pivot) {
      i++;
      quickSwap(array, i, j);
    }
  }
  quickSwap(array, i + 1, high);
  return i + 1;
}

void quickSwap(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
