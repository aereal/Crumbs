require "ostruct"
require "pathname"
require "uri"
require "yaml"

$: << File.dirname(File.expand_path(__FILE__))

require "crumbs/core_ext"

module Crumbs
	module Exceptions
		class CrumbsError < StandardError; end
		class PackageNotFound < CrumbsError; end
	end
	include Exceptions

	DefaultConfig = {
		:prefix => __FILE__.to_path + '../../',
	}

	user_config = YAML.load('~/.crumbs/config'.to_path.open)
	Config = OpenStruct.new(DefaultConfig.merge(user_config))

	autoload :Package, 'crumbs/package'
end
