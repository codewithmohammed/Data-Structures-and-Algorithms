

class TrieNode1<T> {
  T? key;
  TrieNode1<T>? parent;
  TrieNode1({this.key, this.parent});

  Map<T, TrieNode1<T>?> children = {};
  bool isTerminating = false;
}

class StringTrie1 {
  TrieNode1<int> root = TrieNode1(key: null, parent: null);

  void insert(String value) {
    var current = root;
    for (var codeUnit in value.codeUnits) {
      current.children[codeUnit] ??= TrieNode1(key: codeUnit, parent: current);
      current = current.children[codeUnit]!;
    }
    current.isTerminating = true;
  }

  bool contains(String value) {
    var current = root;
    for (var codeUnits in value.codeUnits) {
      var child = current.children[codeUnits];
      if (child == null) {
        return false;
      }
      current = child;
    }
    return current.isTerminating;
  }

  void remove(String text) {
    var current = root;
    for (var codeUnits in text.codeUnits) {
      var child = current.children[codeUnits];
      if (child == null) {
        return;
      }
      current = child;
    }
    current.isTerminating = false;

    while(!current.isTerminating && current.parent != null && current.children.isEmpty){
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }
}
