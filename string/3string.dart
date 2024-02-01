import 'dart:io';

void main() {
  print('Enter the Sentence to Capitalize the First letter of every word');

  String? sentence = stdin.readLineSync()!;

  String capitalizedSentence = capitalizeFirstLetter(sentence);
  print(capitalizedSentence);
}

String capitalizeFirstLetter(String sentence) {
  List<String> words = sentence.split(' ');
  List<String> capitalizedWords = [];

  for (String word in words) {
    if (word.isNotEmpty) {
      String capitalizedWord =
          word[0].toUpperCase() + word.substring(1).toLowerCase();
      capitalizedWords.add(capitalizedWord);
    }
  }
  return capitalizedWords.join(' ');
}
