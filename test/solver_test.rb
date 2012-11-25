# encoding: utf-8

require_relative 'helper'

require_relative '../lib/solver'

class TestPuzzleBuilder < MiniTest::Unit::TestCase
	def setup
		@builder = PuzzleBuilder.new
	end
	
	def test_square_array_from_string
		assert_equal([Square.new(:filled), Square.new(:empty), Square.new(:filled)], @builder.square_array_from_string["X.X"])
	end
	
	def test_find_runs_in_row_or_column
		array = @builder.square_array_from_string("XX..X.XXX")
		result = @builder.find_runs_in_row_or_column(array)
		assert_equal([2, 1, 3], result)
	end
end