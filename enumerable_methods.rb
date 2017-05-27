module Enumerable
	def my_each
		# take a list and perform a certain action on each item in the list
		for i in 0...self.length
			yield self[i]
		end
		# anther way using while loop
		#curent_index=0
		#while curent_index<list.length do
		#	yield(list[curent_index])
		#	curent_index+=1
		#end
	end

	def my_each_with_index
		# take a list and perform a certain action on each item and its index
		for i in 0...self.length
			yield(self[i],i)
		end
		# anther way using while loop
		#curent_index=0
		#while curent_index<list.length do
		#	yield(list[curent_index], curent_index)
		#	curent_index+=1
		#end
	end

	def my_select
		#take a list and run a condition statement on each item and return a list of the items that match the condition
		new_list=Array.new
		self.my_each do |i|
			if yield(self[i])
				new_list<<i
			end
		end
		return new_list
	end

	def my_all?(&block)
		#run a condition statement on each item and return true if all items pass the condition false otherwise
		unless block_given?
			block= lambda{|x| x}
		end
		return my_select(&block).length==self.length
	end

	def my_any?(&block)
		#run a block on the list items and return true if any block is true-thy
		unless block_given?
			block= lambda {|x| x}
		end
		return my_select(&block).length>0
	end

	def my_none?(&blcok)
		#run a statement in every item in the list and return true if none of the blocks return true
		unless block_given?
			block= lambda {|x| x}
		end
		return my_select(&block).length == 0
	end

	def my_count(num=nil, &block)
		#count the items in the list that pass the condition statement
		unless num || block_given?
			return self.length
		end
		if num
			return self.my_select{|i| i==num}.length
		elsif block_given?
			return self.my_select(&block).length
		end
	end

	def my_map(p=nil)
		#return a new list of all items after get passed in the block
		result=Array.new
		self.each do |i|
			if block_given? && p==nil
				result<<yield(self[i])
			elsif !block_given? && p==nil
				return self.to_enum
			end
		end
		return result
	end

	def my_inject(initial=nil)
		#return a sum value for all the items values after passing the block
		if initial==nil
			accumulator=self[i]
		else
			accumulator=initial
		end
		self.my_each do |value|
			accumulator=yield(accumulator, value)
		end
		return accumulator
	end

	def multiply_els(list)
		#multiplies all the elements of the array together by using #my_inject
		return list.my_inject(1){|product, value| product*value}
	end
end

