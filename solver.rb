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

class Square
	def initialize
		@mark = :empty
	end
	
	def empty?
		@mark == :empty
	end
	
	def filled?
		! self.empty?
	end
	
	def to_s
		if self.empty?
			"."
		else
			"X"
		end
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