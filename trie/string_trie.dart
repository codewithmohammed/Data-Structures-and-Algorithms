import 'trie_node.dart';

class StringTrie {
  TrieNode<int> root = TrieNode(key: null, parent: null);
  void insert(String text) {
    // print(text.codeUnits);

    //we make the root to the current . root is a treinode which doesn't have key or parent but only have children /children is a map of value to TrieNode .

    //incase of inserting an word in to the trienode we make the first node to be inserted into the children of the root the value in the children will be the codeUnits of the text and the Trienode will consist the key as codUnit itself and parent as root.then we change the current(which was the root) to the inserted trieNode.

    //if any codeUnit of a character become the same then there will not be any addition of the TrieNode.

    //after the element is added in it's place then there we will give a sign the trienodes are terminating there.
    var current = root;
    for (var codeUnit in text.codeUnits) {
      current.children[codeUnit] ??= TrieNode(key: codeUnit, parent: current);
      current = current.children[codeUnit]!;
    }
    current.isTerminating = true;
  }

  //this is to check whether the trie contains the text or not .it will iterate through all the trieNode and finds the first codeUnits then from that child it will search for other and if the CodeUnit of a paricular char doesn't exist then we can conclude that the word doesn't exist in the trie tree so we will return false and if there is that word then we can return isTerminating of the last node which will be true.

  bool contains(String text) {
    var current = root;
    for (var codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return false;
      }
      current = child;
    }
    return current.isTerminating;
  }

  //removing the text from the trie tree

  //we iterate thorough the trie tree and first checks if the word is there or not by iterating through it and if the word doesn't exist the while loop will exit and check if the last trienode is the terminating one if it is not then we will return

  //if it is the terminating trienode then we will make the last trienodes terminating to false because there will not be the text in order that to be a terminating node.

  //and we will iterate backwards from the last trienode and makes the chldren(map) of the parent to null and put the current(was last trienode) to it's parent.

  void remove(String text) {
    var current = root;
    for (final codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return;
      }
      current = child;
    }
    if (!current.isTerminating) {
      return;
    }
    current.isTerminating = false;
    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }

  List<String> matchPrefix(String prefix) {
    var current = root;
    for (final codeUnit in prefix.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return [];
      }
      current = child;
    }
    return _moreMatched(prefix, current);
  }

  List<String> _moreMatched(String prefix, TrieNode<int> node) {
    List<String> results = [];
    if (node.isTerminating) {
      results.add(prefix);
    }
    for (final child in node.children.values) {
      final codeUnit = child!.key!;
      results.addAll(
          _moreMatched('$prefix${String.fromCharCode(codeUnit)}', child));
    }
    return results;
  }
}

