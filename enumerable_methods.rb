module Enumerable
	def my_each(list)
		# take a list and perform a certain action on each item in the list
		for i in list
			yield(i)
		end
		# anther way using while loop
		#curent_index=0
		#while curent_index<list.length do
		#	yield(list[curent_index])
		#	curent_index+=1
		#end
	end

	def my_each_with_index(list)
		# take a list and perform a certain action on each item and its index
		for i in 0...list.length
			yield(list[i],i)
		end
		# anther way using while loop
		#curent_index=0
		#while curent_index<list.length do
		#	yield(list[curent_index], curent_index)
		#	curent_index+=1
		#end
	end

	def my_select(list)
		#take a list and run a condition statement on each item and return a list of the items that match the condition
		new_list=Array.new
		my_each(list) do |i|
			if yield(i)
				new_list<<i
			end
		end
		return new_list
	end

	def my_all?(list)
		#run a condition statement on each item and return true if all items pass the condition false otherwise
		bool=true
		my_each(list) do |i|
			yield(i) || bool=false
		end 
		return bool
	end

	def my_any?(list)
		#run a block on the list items and return true if any block is true-thy
		my_each(list) do |i|
			if block_given?
				if yield(i)
					return true
				end
			else
				return true
			end
		end
		return false
	end

	def my_none?(list)
		#run a statement in every item in the list and return true if none of the blocks return true
		bool=true
		my_each(list) do |i|
			yield(i) && bool=false
		end
		return bool
	end

	def my_count(list)
		#count the items in the list that pass the condition statement
		count=0
		my_each(list) do |i|
			if yield(i)
				count+=1
			end
		end
		return count
	end

	def my_map(list)
		#return a new list of all items after get passed in the block
		new_list=Array.new
		my_each(list) do |i|
			new_list<<yield(i)
		end
		return new_list
	end

	def my_inject(list)
		#return a sum value for all the items values after passing the block
		total=0
		my_each(list) do |i|
			total+=yield(total,i)-total
		end
		return total
	end
end

