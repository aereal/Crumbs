module Crumbs
	module Exceptions
		class CrumbsError < StandardError; end
		class PackageNotFound < CrumbsError; end
	end
	include Exceptions

	$: << File.dirname(__FILE__)
	require "crumbs/client"
end
