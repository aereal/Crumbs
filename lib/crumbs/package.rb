class Crumbs::Package
	REQUIRED_SPECS = [:url, :version, :site]
	RESERVED_DIRS  = %w(bin etc lib man sbin share src)

	attr_reader :url, :version, :site

	RESERVED_DIRS.each do |dir|
		define_method(dir) { prefix + dir }
	end

	def initialize(spec)
		raise ArgumentError unless (REQUIRED_SPECS - spec.keys).empty?

		spec[:url]  = URI(spec[:url])
		spec[:site] = URI(spec[:site])
		spec.each do |k, v|
			self.instance_variable_set("@#{k}", v)
			self.class.send(:attr_reader, k)
		end
	end

	def dist_root
		# TODO
		Pathname.new
	end

	def prefix
		# TODO
		@prefix ||= Pathname.new(Config.prefix || '/usr/local/crumbs')
	end
end
