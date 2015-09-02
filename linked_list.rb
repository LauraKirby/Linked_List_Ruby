require 'pry'
# ------------- NODE CLASS ------------- 
# create a class named Node, that we will use to initialize new objects
# each node object will be initialized with the properties data and next. 
# data and next are available to be read and written to.
# when a new Node object is created, it must take an argument for d
class Node 
	attr_accessor :data, :next 

	def initialize(d)
		@data = d
	end 

end #end node class


# ------------- LIST CLASS ------------- 
# create methods that you would like to call on your Node/node list

class List 
	attr_accessor :head

	def initialize(data)
		@head = Node.new(data)
	end

	#if you have the head, then you have the entire list
	def recursive_print(result="", node=@head)
		if node.nil?
			return result
		end 
		result += node.data
		if node.next 
			result += " > "
		end 
		recursive_print(result, node.next)
	end 

	def push(newData)
		current_node = @head
		res = [];
		while current_node.next
			current_node = current_node.next 
			res.push(current_node.next)
		end 
		current_node.next = Node.new(newData)
	end 

	def to_string
		current_node = @head
		res = ""
		while current_node.next 
			res += current_node.data
			current_node = current_node.next
			if current_node
				res += " > "
			end
		end 
		res += current_node.data 
	end 

	#pop remove last item from the list
	def pop
		current_node = @head # @head = Node.new(data)
		res = ""
		while current_node.next 
			res += current_node.data
			if current_node
				res += " > "
			end
			current_node = current_node.next
		end 
		res.chomp(" > ") #+= current_node.data 
	end
	#this works but prob not the solution 
	#splitStr = to_string.split(" > ")
	#splitStr.pop





		

		

end #end List class


# ------------- INSTANCE CREATION ------------- 

my_list = List.new("red")
my_list.push("orange")
my_list.push("yellow")
my_list.push("green")
my_list.push("blue")
my_list.push("purple")
#p my_list

#p my_list.recursive_print
#my_list.to_string()

p my_list.pop

#Questions: 
# we shouldn't be able to access push unless we add it to attr_getter, right?
# since we can read and write to @head, that means we can call it's public methods?

# closer to find 
	#pop remove last item from the list
	# def pop(nodeData)
	# 	splitStr = to_string.split(nodeData)
		
	# 	splitStr.map.with_index { |x, i| x[0..i]}
	# 	p splitStr
	# 	#current_node = @head
	# 	#p current_node = @head
	# 	#current_node.split(nodeData)
	# end 