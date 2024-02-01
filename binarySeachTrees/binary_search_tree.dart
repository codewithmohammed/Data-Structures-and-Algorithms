
import 'binary_node.dart';

class BinarySearchTree<E extends Comparable<E>> {
  BinaryNode<E>? root;
  //this is for inserting a node into the binary tree

  void insert(E value,) {
    //we need to send the root and the value to be inserted the root is send whether to check there is a root or not ,if there is no root a BinaryNode with the value in it must be returned that is to assign to the root so now we have a root,

    //now if we try to insert other node it will send the root which we already have(not null) and the value
    root = _insertAt(root, value);
  }



  //this is for inserting a node into the binary tree
//here in the parameter the node can be null coz if there no node added before that is there is no root .

  BinaryNode<E> _insertAt(BinaryNode<E>? node, E value) {
    //if the node(root) is null the it will return a BinaryNode with the value in it
    if (node == null) {
      return BinaryNode(value);
    }
    //if the node(root) is not null then it will compare the value with the node(root).value so we can know to which side node the value should be added.

    //the value is compared if its compared to the root value and got the return which is negative(its less thean the node(root) value) the value if recursively may be added to the leftchild

    //else if the return value is a positive integer(its more than the node(root) value) the value is recursively may be added to the rightchild

    // this will be recursively done until the node becomes null so that it will return a BinaryNode() with a value in it so that will be assigned to the right or left node

    //after the value is returned the node with left and right will be returned to the root
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    return node;
  }

  void remove(E value) {
    root = _remove(root, value);
  }

  //this is to remove a node from the binary tree.

  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
    //first chech weather the node(root) is null or not ,if its null then return null
    if (node == null) {
      return null;
    }
    //if the value to removed is equal to the value of the node(root)
    if (value == node.value) {
      //then check if the right and left child of the node is is null or not if its null then return null because if we remove the root.value then the root must be null
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }

      //if the value is equal to the root value we have to make the rightchild or leftchild as the root by there removing the current root

      //if the above condition fails then check if the leftchild of the node is null or not if its null then return rightchild of the node as the root
      if (node.leftChild == null) {
        return node.rightChild;
      }
      // if the rightchild is null then return the leftchild of the node as the root
      if (node.rightChild == null) {
        return node.leftChild;
      }
      //if non of the above condition became true then change the node.that is  Node to be removed has both left and right children
      // Find the minimum value in the right subtree and replace the current node's value
      node.value = node.rightChild!.min.value;
      // Remove the node with the minimum value from the right subtree
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      //if the value to be removed is less than the current node's value.go left
      node.leftChild = _remove(node.leftChild, value);
    } else {
      //if the value to be removed is greater than the current node's value, go right.
      node.rightChild = _remove(node.rightChild, value);
    }
    //return the node that is the root to root
    return node;
  }
//the function checks whether the tree contains the element or not.
  bool contains(E value) {
    //first assign the root to a variable
    var current = root;
    while (current != null) {
      //if current.value = value then return true.
      if (current.value == value) {
        return true;
      }
      //compares the value to the current value and update the current to the right or left child.until the above if condition return true otherwise return false.
      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }
    return false;
  }

  

@override
  String toString() => root.toString();
}

extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}
