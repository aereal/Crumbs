class ::String
	def expand
		Pathname.new(self)
	end
end
