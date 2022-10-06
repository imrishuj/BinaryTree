import UIKit

public class TreeNode {
    
    public var val: Int
    public var left: TreeNode? = nil
    public var right: TreeNode? = nil
    
    public init(_ val: Int) {
        self.val = val
    }
}

class BinaryTree {
    
    var root: TreeNode? = nil
    
    func nodeCount(_ rootNode: TreeNode?) -> Int {
        guard rootNode != nil else { return 0 }
        let left = self.nodeCount(rootNode?.left)
        let right = self.nodeCount(rootNode?.right)
        return left + right + 1
    }
    
    func leafNodeCount(_ rootNode: TreeNode?) -> Int {
        guard rootNode != nil else { return 0 }
        let count: Int = self.leafNodeCount(rootNode?.left) + self.leafNodeCount(rootNode?.right)
        if rootNode?.left == nil && rootNode?.right == nil {
            return count + 1
        }
        return count
    }
    
    func internalNodeCount(_ rootNode: TreeNode?) -> Int {
        guard rootNode != nil else { return 0 }
        let count: Int = self.leafNodeCount(rootNode?.left) + self.leafNodeCount(rootNode?.right)
        if rootNode?.left != nil && rootNode?.right != nil {
            return count + 1
        }
        return count
    }
    
    func height(_ rootNode: TreeNode?) -> Int {
        guard rootNode != nil else { return 0 }
        let left = self.height(rootNode?.left)
        let right = self.height(rootNode?.right)
        return (left > right) ? left + 1 : right + 1
    }
    
    func preOrder(_ rootNode: TreeNode?) {
        guard rootNode != nil else { return }
        print(rootNode?.val as Any, terminator: " ")
        self.preOrder(rootNode?.left)
        self.preOrder(rootNode?.right)
    }
    
    func inOrder(_ rootNode: TreeNode?) {
        guard rootNode != nil else { return }
        self.inOrder(rootNode?.left)
        print(rootNode?.val as Any, terminator: " ")
        self.inOrder(rootNode?.right)
    }
    
    func postOrder(_ rootNode: TreeNode?) {
        guard rootNode != nil else { return }
        self.postOrder(rootNode?.left)
        self.postOrder(rootNode?.right)
        print(rootNode?.val as Any, terminator: " ")
    }
}

func createBinaryTree() {
    let bTree = BinaryTree()
    bTree.root = TreeNode(5)
    bTree.root?.left = TreeNode(4)
    bTree.root?.right = TreeNode(7)
    bTree.root?.right?.right = TreeNode(10)
    bTree.root?.right?.left = TreeNode(6)
    bTree.root?.left?.left = TreeNode(3)
    bTree.root?.right?.left?.right = TreeNode(8)
    bTree.root?.left?.left?.right = TreeNode(9)
    print("PREORDER TRAVERSAL", bTree.preOrder(bTree.root))
    print("INORDER TRAVERSAL", bTree.inOrder(bTree.root))
    print("POSTORDER TRAVERSAL", bTree.postOrder(bTree.root))
    print("HEIGHT OF TREE", bTree.height(bTree.root))
    print("TOTAL NODES", bTree.nodeCount(bTree.root))
    print("TOTAL LEAF NODES", bTree.leafNodeCount(bTree.root))
    print("TOTAL INTERNAL NODES", bTree.internalNodeCount(bTree.root))
}

createBinaryTree()



