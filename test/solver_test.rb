# encoding: utf-8

require_relative 'helper'

require_relative '../lib/solver'

class TestPuzzleBuilder < MiniTest::Unit::TestCase
	def setup
		@builder = PuzzleBuilder.new
	end
	
	def test_square_array_from_string
		array_strings_and_expecteds = {
			"X" => [Square.new(:filled)],
			"." => [Square.new(:empty)],
			"X.X" => [Square.new(:filled), Square.new(:empty), Square.new(:filled)],
		}
		array_strings_and_expecteds.each do |array_string, expected|
			actual = @builder.square_array_from_string(array_string)
			assert_equal(expected, actual)
		end
	end
	
	def test_find_runs_in_row_or_column
		array_strings_and_expecteds = {
			"XX..X.XXX" => [2, 1, 3],
			"X" => [1],
			"." => [],
			"...X..X..." => [1, 1],
		}
		array_strings_and_expecteds.each do |array_string, expected|
			array = @builder.square_array_from_string(array_string)
			actual = @builder.find_runs_in_row_or_column(array)
			assert_equal(expected, actual)
		end
	end
end