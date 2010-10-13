module Crumbs::Fetcher
	module Curl
		def fetch
			system 'curl', '-O', self.url
		end
	end

	module Wget
		def fetch
			system 'wget', self.url
		end
	end
end
