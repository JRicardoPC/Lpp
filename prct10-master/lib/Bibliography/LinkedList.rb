Node = Struct.new(:value, :next, :prev)

class LinkedList
    include Enumerable
    attr_reader :start, :end
    def initialize(nodes)
        for i in 0..nodes.length-1 do
            nodes[i]=Node.new(nodes[i],nil,nil)
        end
        
        x = nodes.length
        x -= 1
        @end = nodes[0]
        @start = nodes[x]
        if x > 1
            @end.next = nodes[1]
            
            for j in 1..x-1 do
                nodes[j].next = nodes[j+1]
                nodes[j].prev = nodes[j-1]
            end
            @start.prev = nodes[x-1]
        end
        
    end
    
    def pop_detras
        raise if @start == @end
        aux = @start.value.to_s
        @start = @start.prev
        aux
    end
    
    def pop_delante
        #raise if @start == @end
        aux = @end.value.to_s
        @end = @end.next
        aux
    end
    
    def push_detras(node)
        node = Node.new(node,nil,nil)
        @start.next = node.to_s
        node.prev = @start
        @start = node
    end
    
    def push_delante(node)
        node = Node.new(node,nil,nil)
        @end.prev = node
        node.next = @end
        @end = node
    end
    
    def each
	    aux = @start
		while aux != nil do
		    yield aux.value
			aux = aux.prev
		end
	end
	
end