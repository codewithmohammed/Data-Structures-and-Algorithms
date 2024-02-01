class TrieNode<T> {
  T? key;
  TrieNode<T>? parent;
  TrieNode({this.key, this.parent});

  Map<T, TrieNode<T>?> children = {};
  bool isTerminating = false;
}
