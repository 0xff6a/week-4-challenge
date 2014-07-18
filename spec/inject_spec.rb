require 'inject'

describe 'Inject method:' do

	let(:arg) 	{ 10 		}
	let(:array) {[1,2,3]}

	context 'Iterative inject' do

		it 'should take an initial value argument' do
			expect(array.my_inject(arg) { |a,b| a }).to be arg
		end
		
		it 'should default to first element of the collection if no initial value is given' do
			expect(array.my_inject() {|a,b| a }).to be array.first
		end

		it 'should be passed a block' do
			expect{ |a| array.my_inject(&a) }.to  yield_successive_args(Array, Array, Array)
		end

		it 'should have specific arguments passed to the block' do
			expect{ |a| [1].my_inject(&a) }.to  yield_with_args(1,1)
		end

		it 'implement inject functionality when passed no initial argument' do
			expect(array.my_inject(0) {|a,b| a + b }).to be 6
		end

		it 'implement inject functionality when passed an initial argument' do
			expect(array.my_inject(arg) {|a,b| a * b }).to be 60
		end

	end

	context 'Recursive inject' do

		it 'should take an initial value argument' do
			expect(array.my_recursive_inject(arg) { |a,b| a }).to be arg
		end
		
		xit 'should default to first element of the collection if no initial value is given' do
			expect(array.my_recursive_inject() {|a,b| a }).to be array.first
		end

		xit 'should be passed a block' do
			expect{ |a| array.my_recursive_inject(&a) }.to  yield_successive_args(Array, Array, Array)
		end

		xit 'should have specific arguments passed to the block' do
			expect{ |a| [1].my_recursive_inject(&a) }.to  yield_with_args(1,1)
		end

		xit 'implement inject functionality when passed no initial argument' do
			expect(array.my_recursive_inject(0) {|a,b| a + b }).to be 6
		end

		xit 'implement inject functionality when passed an initial argument' do
			expect(array.my_recursive_x§xinject(arg) {|a,b| a * b }).to be 60
		end

	end

end

