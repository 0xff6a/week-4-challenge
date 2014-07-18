class Array

	def my_inject(memory = self.first)
		self.each do |element| 
			memory = yield(memory, element)
		end
		memory
	end

	def my_recursive_inject

	end

end