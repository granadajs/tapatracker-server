require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

module SafeEnv
  def self.[](name)
    ENV[name].tap{ |value| raise "Must set environment variable #{name}" unless value.to_s.length > 0 }
  end
end
SAFE_ENV = SafeEnv
