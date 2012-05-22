#!/usr/bin/env ruby
#################################################
# Author: Weston Neal
# Date: 5/19/2012
# Desctipion: 
#   Challenges 1-3   
#################################################

# Challenge 1
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

# Challenge 2  
#The Tree class was interesting, but it did not allow you to specify a new tree with a clean interface. Let the initializer accept a nested structure with hashes and arrays. You should be able to specify a tree like this: 
# { "grandpa" => { "dad" => { "child1" => {}, "child2" => {} }, "uncle" => { "child3" => {}, "child4" => {} } } }.
#

class Tree
    attr_accessor :childNodes; attr_accessor :name; 
     
    def initialize(treeData)
        @name = "root";
        @childNodes = [];
         
        if (treeData.size() == 1)
            @name = treeData.keys()[ 0 ];
             
            treeData[ @name ].each{ |key, value|
                @childNodes.push(
                Tree.new( { key => value } )
                )
            }
        else
            treeData.each{ |key, value|
                @childNodes.push( Tree.new( { key => value } ) )
            }
        end
    end
     
    def visitAll( &block )
        visit( &block );
        childNodes.each{ |c|
            c.visitAll( &block )
        }
    end
     
    def visit( &block )
        block.call( self );
    end
end
 
# Create our new Tree.
tree = Tree.new(
    { "grandpa" => { "dad" => { "child1" => {}, "child2" => {} }, "uncle" => { "child3" => {}, "child4" => {} } } }
);
 
 
tree.visitAll{ |node| 
    puts( "#{node.childNodes}" ); 
};

# Challenge 3
def search_file(filename, searchParam)
    f = File.open("#{filename}", "r")
    lines = []
    
    currLine = 1
    f.each { |line|
        lines.push(currLine) if line[/#{searchParam}/]
        currLine = currLine + 1
    }

    return lines.to_s
end

puts search_file("grep.txt", "I")
