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

class Puzzle
	attr_reader :row_runs, :column_runs, :grid
	
	def initialize(row_runs, column_runs)
		
		@grid = Array.new(row_runs.size, Array.new(column_runs.size, Square.new))
	end
	
	def all_runs
		@row_runs + @column_runs
	end
	
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