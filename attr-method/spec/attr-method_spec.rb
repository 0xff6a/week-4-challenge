require 'attr-method'

describe 'attr methods' do 

	let(:test_read) 	{ TestGetter.new		}
	let(:test_write) 	{ TestWriter.new		}
	let(:test_access) { TestAccessor.new	}

	context 'attr_reader' do

		it 'should create a getter method' do
			expect(test_read.first_variable).to be true
			expect(test_read.second_variable).to be false
		end

	end

	context 'attr_writer' do

		it 'should create a setter method' do
			test_write.first_variable = false
			test_write.second_variable = true
			expect(test_write.instance_variable_get("@first_variable")).to be false
			expect(test_write.instance_variable_get("@second_variable")).to be true
		end

	end

	context 'attr_accessor' do

		it 'should create a getter method' do
			expect(test_access.first_variable).to be true
		end

		it 'should create a setter method' do
			test_access.second_variable = false
			expect(test_access.second_variable).to be false
		end

	end
	
end