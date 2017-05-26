module Enumerable
	def my_each(list)
		# take a list and perform a certain action on each item in the list
		#for i in list
		#	yield(i)
		#end
		curent_index=0
		while curent_index<list.length do
			yield(list[curent_index])
			curent_index+=1
		end
	end

	def my_each_with_index(list)
		# take a list and perform a certain action on each item and its index
		#for i in 0...list.length
		#	yield(list[i],i)
		#end
		curent_index=0
		while curent_index<list.length do
			yield(list[curent_index], curent_index)
			curent_index+=1
		end
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
end

