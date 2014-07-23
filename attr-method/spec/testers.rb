class TestGetter

	my_attr_reader :first_variable, :second_variable

	def initialize
		@first_variable = true
		@second_variable = false
	end

end

class TestWriter

	my_attr_writer :first_variable, :second_variable

end

class TestAccessor

	my_attr_accessor :first_variable, :second_variable

	def initialize
		@first_variable = true
	end

end