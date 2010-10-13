require "fileutils"
require "pathname"

class String
	def to_path
		Pathname.new(self)
	end
end

class Pathname
	def install(dst)
		FileUtils.install self.to_s, dst.to_s
	end

	def /(that)
		join that.to_s
	end
end
