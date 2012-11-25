# encoding: utf-8

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