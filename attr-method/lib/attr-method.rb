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
