# encoding: utf-8

require_relative 'helper'

require_relative '../lib/solver'

class TestPuzzleBuilder < MiniTest::Unit::TestCase
	def setup
		@builder = PuzzleBuilder.new
	end
	
	def test_square_array_from_string
		assert_all_equal_after_processing({
			"X" => [Square.new(:filled)],
			"." => [Square.new(:empty)],
			"X.X" => [Square.new(:filled), Square.new(:empty), Square.new(:filled)],
		}) do |array_string|
			@builder.square_array_from_string(array_string)
		end
	end
	
	def test_find_runs_in_array
		assert_all_equal_after_processing({
			"XX..X.XXX" => [2, 1, 3],
			"X" => [1],
			"." => [],
			"...X..X..." => [1, 1],
		}) do |array_string|
			array = @builder.square_array_from_string(array_string)
			@builder.find_runs_in_array(array)
		end
	end
end