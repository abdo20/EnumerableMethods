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
end

