class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

    def dfs(n)
        @children.each do |child|
            node = child.dfs(n)
            if node != nil
                return node
            end
        end

        if payload == n
            return self
        else
            return nil
        
        end
    end

    def bfs(n)
        node = self
        queue = MyQueue.new

        while node != nil
            if node.payload == n
                return node
            end
            node.children.each do |child|
                queue.enqueue(child)
            end
            node = queue.dequeue
        end
    end
end

class MyQueue
    def initialize
        @queue = []
    end

    def enqueue(item)
        @queue.push(item)
    end

    def dequeue
        @queue.shift
    end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

queue = MyQueue.new

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
puts queue.dequeue
queue.enqueue(6)
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue

puts "----------"

puts "The Depth-First Search is #{trunk.dfs(11).payload}"
puts "----------"
puts "The Breath-First Search is #{trunk.bfs(11).payload}"