class Array

	def my_inject(memory = self.first)
		self.each do |element| 
			memory = yield(memory, element)
		end
		memory
	end

	def my_recursive_inject(memory = self.first, &block)
		return memory if self.empty?
		arg = self.shift
		return yield(self.my_recursive_inject(memory, &block), arg)
	end


end