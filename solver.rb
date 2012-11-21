class Class
	def initializer(*args, &b)
		define_method(:__init_proc) {b}
		params = args.join(", ")
		vars = args.collect{|a| "@#{a}"}.join(", ")
		
		class_eval <<-EOS
def initialize(#{params})
	#{vars} = #{params}
	instance_eval &__init_proc
end
		EOS
	end
end


class Line
	initializer(:puzzle, :orientation, :line_number) do
		
	end
end

# a blank puzzle – just the empty grid and the numbers in the border
class Puzzle
	attr_reader :row_runs, :column_runs
	
	def initialize(row_runs, column_runs)
		@row_runs = row_runs
		@column_runs = column_runs
	end
	
	def all_runs
		@row_runs + @column_runs
	end
	
	def to_s
		
	end
end

class PuzzleBuilder
	def matrix_of_squares_from_rows_of_strings(string_rows)
		character_mappings = {
			"X" => Square.new(:filled), # TODO verify that don’t need to clone Squares in proc; Squares are immutable
			"." => Square.new(:empty),
		}
		return string_rows.map do |string|
			char_array = string.to_a # TODO verify against String core API
			char_array.map do |char|
				character_mappings[char]
			end
		end
	end
	
	def puzzle_from_picture(squares_matrix_rows)
		row_runs = squares_matrix_rows.map do |row_of_squares|
			find_runs_in_row_or_column(row_of_squares)
		end
		
		squares_matrix_columns = transpose_matrix(squares_matrix_rows)
		
		column_runs = squares_matrix_columns.map do |column_of_squares|
			find_runs_in_row_or_column(column_of_squares)
		end
		
		return Puzzle.new(row_runs, column_runs)
	end
	
	def find_runs_in_row_or_column(row_or_column_of_squares)
		runs_so_far = []
		current_run_count = 0 # how many consecutive filled squares seen
		
		row_or_column_of_squares.each do |square|
			if square.filled?
				current_run_count += 1
			else
				if current_run_count > 0
					runs_so_far.push(current_run_count)
					current_run_count = 0
				end
			end
		end
		# TODO fix this duplication
		if current_run_count > 0
			runs_so_far.push(current_run_count)
			current_run_count = 0
		end
		
		return runs_so_far
	end
end

# a puzzle’s solution in progress – a grid with squares unknown, filled in or ruled out
class SolutionAttempt
	attr_reader :grid
	
	def initialize()
		@grid = Array.new(row_runs.size, Array.new(column_runs.size, Square.new))
		# TODO check for duplication bugs – do I need to pass a proc instead of an
		#  Array literal to the outer array, or does Array #clone them for me?
	end
	
	def [](row, column)
		
	end
	
	def fill_in(row, column, state)
		
	end
	alias :[]= :fill_in
	
	def complete?
		
	end
	alias :solved? :complete?
	
	def to_s
		
	end
end

def display_solution_attempt(solution_attempt)
	# print the solution attempt grid and the puzzle question around its borders
end

class Square
	attr_reader :contents
	
	def initialize(contents=:unknown)
		@contents = contents
	end
	
	# TODO include StringQuerier (whatever it’s called) like Rails does for environment names
	def unknown?
		@contents == :unknown
	end
	def empty?
		@contents == :empty
	end
	def filled?
		@contents == :filled
	end
	
	def to_s
		strings = {
			:unknown => "?",
			:empty => ".",
			:filled => "X",
		}
		return strings[@contents]
	end
end

class Solver
	def initialize(puzzle)
		@puzzle = puzzle
	end
	
	def solve
		
		
		@puzzle
	end
end