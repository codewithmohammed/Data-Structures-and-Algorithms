import 'dart:io';

void main() {
  print('Enter what number of the proceeding letter should be replaced');
  int? n = int.parse(stdin.readLineSync()!);
  print('Enter the word to change the letters');
  String? word = stdin.readLineSync()!;

  String transformedString = changeTheLetters(word, n);
  print(transformedString);
}

changeTheLetters(String word, int n) {
  StringBuffer result = StringBuffer();

  for (int i = 0; i < word.length; i++) {
    String char = word[i];
    String currentChar = char.toLowerCase();

    if (currentChar.isNotEmpty &&
        currentChar.toLowerCase() != currentChar.toUpperCase()) {
      String newChar = String.fromCharCode(
          (currentChar.codeUnitAt(0) + n - 'a'.codeUnitAt(0)) % 26 +
              'a'.codeUnitAt(0));
      if (char == char.toUpperCase()) {
        newChar = newChar.toUpperCase();
      }
      result.write(newChar);
    } else {
      result.write(currentChar);
    }
  }
  return result.toString();
}
