#!/usr/bin/env ruby
#################################################
# Author: Weston Neal
# Date: 5/19/2012
# Desctipion: 
#   
#################################################

a = (1..16).to_a()

print_queue = []
a.each { |i| 
    print_queue.push(i)
    
    if print_queue.size == 4
        puts print_queue.to_s
        print_queue.clear
    end
}

a.each_slice(4) { |i| puts i.inspect }

#The Tree class was interesting, but it did not allow you to specify a new tree with a clean interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: 
# { "grandpa" => { "dad" => { "child1" => {}, "child2" => {} }, "uncle" => { "child3" => {}, "child4" => {} } } }.
#

class Tree
    attr_accessor :children, :node_name

    def initialize( treeStructure )
        treeStructure.each { |key, value| 
            @children = value
            @node_name = key
        }
    end

    # Create a new tree for each child
    def build_tree

    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end

    def to_s
       return "#{node_name} -> #{children}"
    end
end

ruby_tree = Tree.new( { "grandpa" => { "dad" => { "child1" => {}, "child2" => {} }, "uncle" => { "child3" => {}, "child4" => {} } } } )

puts ruby_tree.to_s
# family_hash.each {|key, value| puts "#{key} is a #{value}" value.each {|key, value| puts "#{key} is a #{value}" value.each {|key, value| puts "#{key} is a #{value}" } if value.is_a?(Hash) } if value.is_a?(Hash) }


