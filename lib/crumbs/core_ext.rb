require "pathname"

class String
	def to_path
		Pathname.new(self)
	end
end
