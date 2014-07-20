class Array

	def my_inject(memory = self.first)
		self.each do |element| 
			memory = yield(memory, element)
		end
		memory
	end

	def my_recursive_inject(memory = self.first, &block)
		return memory if self.empty?
		array = self.clone
		argument = array.shift
		return yield(array.my_recursive_inject(memory, &block), argument)
	end
	
end