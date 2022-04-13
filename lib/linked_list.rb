require_relative './node'

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        if !@head
            @head = node
        else
            holder = @head
            @head = node
            @head.next_node = holder
        end
    end

    def append(node)
        if !@head
            @head = node
        else
            current_node = @head
            while current_node.next_node != nil
                current_node = current_node.next_node
            end
            current_node.next_node = node
        end
    end

    def delete_head
        if @head
            @head = @head.next_node
        end
    end

    def delete_tail
        if @head
            if @head.next_node
                current_node = @head
                last_node = @head
                while current_node.next_node != nil
                    last_node = current_node
                    current_node = current_node.next_node
                end
                last_node.next_node = nil
            else
                @head = nil
            end
        end
    end

    def add_after(idx, node)
        current_node = @head
        while idx > 0 && current_node.next_node
            current_node = current_node.next_node
            idx -= 1
        end
        nextnod = current_node.next_node
        current_node.next_node = node
        node.next_node = nextnod
    end

    def search(val)
        current_node = @head
        while current_node.next_node != nil && current_node.data != val
            current_node = current_node.next_node
        end
        current_node
    end

end
