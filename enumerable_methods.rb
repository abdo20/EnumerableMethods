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
		curent_index=0
		new_list=Array.new
		while curent_index<list.length do
			if yield(list[curent_index])
				new_list<<list[curent_index]
			end
			curent_index+=1
		end
		return new_list
	end
end

