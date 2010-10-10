require "ostruct"
require "pathname"
require "uri"
require "yaml"

$: << File.dirname(__FILE__)

require "crumbs/core_ext"

module Crumbs
	module Exceptions
		class CrumbsError < StandardError; end
		class PackageNotFound < CrumbsError; end
	end
	include Exceptions

	user_config = YAML.load('~/.crumbs/config'.expand.open)
	Config = OpenStruct.new(user_config)

	autoload :Package, 'crumbs/package'
end
