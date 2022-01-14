require_relative './node'
require 'pry'

class LinkedList
    attr_accessor :head
    def initialize(node = nil)
        @head = node
    end

    def prepend(node)
        return self.head = node unless head
        node.next_node = head
        self.head = node
    end

    def append(node)
        return self.head = node unless head
        last_node.next_node = node
    end

    def delete_head
        if head
            self.head = head.next_node
        end
    end

    def delete_tail
        if second_to_last_node
            second_to_last_node.next_node = nil
        elsif head
            self.head = nil
        end
    end

    def last_node
        return head unless second_to_last_node
        second_to_last_node.next_node
    end

    def second_to_last_node
        second_to_last = nil
        second_to_last = head if head&.next_node
        while second_to_last&.next_node&.next_node do
            second_to_last = second_to_last.next_node
        end
        second_to_last
    end

    def search(value)
        current_node = head
        while current_node do
            return current_node if current_node.data == value
            current_node = current_node.next_node
        end
        nil
    end

    def add_after(index, new_node)
        current_node = head
        while current_node do
            i ||= 0
            if i == index
                new_node.next_node = current_node.next_node
                return current_node.next_node = new_node
            end
            current_node = current_node.next_node
            i += 1
        end
        append new_node
    end
end

