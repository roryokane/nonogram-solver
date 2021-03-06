# Picross puzzle solver design ideas

* In Ruby, with symbols (and `nil`?) as markers, arrays as `Line`s’ runs
* Abstract rows and columns as `Line`s, with way to reference other axis containing this `Line`s’s point
* Use recursion to solve all changed (“dirty”) lines (fast because at the end, sees that line solved and exits quickly)
	* Probably cache whether line is solved so faster at end (premature?)
* Use recursion to test all valid placements of blocks/runs, and mark the squares all possibilities have in comon
* For each run, move from earliest to latest possible placements given end Xs, and skip middle Xs after one collision (some sub-recursion runs may have no valid placements)
* In development, use assertions that each line is valid and that dirty marking solves all
* Use unit tests, too
* Make a better matrix/table class (as I’ve wanted to do for a while) that lets me view it row-wise or column-wise, and provides the same interface for both after I specify that decision
* Stack space required for the recursive rechecking row and column after filling in a square is O(<i>m</i>×<i>n</i>) where <i>m</i> and <i>n</i> are dimensions of puzzle. Do I have to worry about stack overflow for large puzzles? Can I force tail call optimization or something or would I have to convert the recursion to iteration manually?
* have method `find_possible_placements_in_range(Array(Integer) the_runs_that_must_fit, length_of_range)`
* What do I do with puzzles with multiple solutions, such as `[ [[1],[]] , [[],[1]] ]`? Probably resort to brute-force and then show all solutions.
* Be able to give hints of what row or column’s runs indicate the next block to fill.
