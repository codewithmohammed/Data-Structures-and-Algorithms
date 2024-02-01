//This is a binaryNode construction which is a node which will have only two nodes in total right and left node

class BinaryNode<T> {
  T value;
  BinaryNode(this.value);
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;
// this is inOrderTraversal in which the nodes in the binary search tree is traversed such that it first checks the left node before cheching the root node, then after checking the root node then it goes to check up on the right child node

//this is helpful for traversing in a ascendinng order
  void traversalInOrder(void Function(T value) action) {
    leftChild?.traversalInOrder(action);
    action(value);
    rightChild?.traversalInOrder(action);
  }

  // this is preOrderTraversal in which the nodes in the binary search tree is traversed such that it first checks the root then it checks the left node then the right node

  //this is helpul for creating a copy of the tree

  void traversalPreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversalPreOrder(action);
    rightChild?.traversalPreOrder(action);
  }

  // this is postOrderTraversal in which the nodes int the binary search tree is traversed such that it first checks the left child then to the right and finally to the root node .

  // by this we are able to traverse the tree in such way that to access the nodes in descending order

  void traversalPostOrder(void Function(T value) action) {
    leftChild?.traversalPostOrder(action);
    rightChild?.traversalPostOrder(action);
    action(value);
  }

  bool isBST(BinaryNode<int>? root, {int? min, int? max}) {
    //checks if there is a root
    ///if there is no root then it will return true
    if (root == null) {
      return true; // An empty tree is a BST
    }
    //the min/max can be the value of the root/parent
    ///this checks if the min is not null and the value of the root/parent is less than the min if it is then its not a binary tree
    if ((min != null && root.value <= min) ||
        (max != null && root.value >= max)) {
      return false; // Node value violates BST property
    }

    // Recursively check left and right subtrees with updated min and max values
    return isBST(root.leftChild, min: min, max: root.value) &&
        isBST(root.rightChild, min: root.value, max: max);
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(BinaryNode<T>? node,
      [String top = '', String root = '', String bottom = '']) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(node.rightChild, '$top ', '$top┌──', '$top│ ');
    final b = '$root${node.value}\n';
    final c = _diagram(node.leftChild, '$bottom│ ', '$bottom└──', '$bottom ');
    return '$a$b$c';
  }
}
