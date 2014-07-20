class Class

	def my_attr_reader(*args)
		args.each do |arg|
			raise "argument must be a symbol" if not arg.is_a?(Symbol)
			self.class_eval("def #{arg};@#{arg};end")
		end
	end

	def my_attr_writer(*args)
		args.each do |arg|
			raise "argument must be a symbol" if not arg.is_a?(Symbol)
			self.class_eval("def #{arg}=(val);@#{arg}=val;end")
		end
	end

	def my_attr_accessor(*args)
		my_attr_reader(*args)
		my_attr_writer(*args)
	end

end

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