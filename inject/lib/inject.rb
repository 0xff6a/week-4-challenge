class Array

	def my_inject(memory=nil)
		array = self.clone
		memory = array.shift if memory == nil
		array.each do |element| 
			memory = yield(memory, element)
		end
		memory
	end

	def my_recursive_inject(memory = nil, &block)
		return memory if self.empty?
		array = self.clone
		memory = array.shift if memory == nil
		argument = array.shift
		return yield(array.my_recursive_inject(memory, &block), argument)
	end
	
end