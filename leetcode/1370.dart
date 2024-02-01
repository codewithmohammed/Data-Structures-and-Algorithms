void main() {
  final hello = sortString('aabbccccbbaa');
  print(hello);
}

String sortString(String s) {
  List<String> word = s.split('');
  print(word);
  List<String> result = [];
  while (word.length > 0) {
    String key = '';
    word.sort();
    for (int i = 0; i < word.length; i++) {
      int res = word[i].compareTo('{');
      // print('z'.codeUnits);
      if (res < 0 && word[i] != key) {
        key = word[i];
        result.add(word[i]);
        print(result);
        word.removeAt(i);
        i--;
      }
    }
    word.sort((b, a) => a.compareTo(b));
    key = '';
    for (int i = 0; i < word.length; i++) {
      int res = word[i].compareTo('.');
      if (res >= 0 && word[i] != key) {
        key = word[i];
        result.add(word[i]);
        word.removeAt(i);
        i--;
      }
    }
  }
  String retString = result.join();
  return retString;
}
