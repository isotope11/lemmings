require 'rubygems'
require 'bundler'

require 'pry'

require 'turn/autorun'
require 'minitest/spec'
require 'minitest/matchers'
require 'mocha/setup'

Turn.config.format = :outline

require_relative '../lib/lemmings'
include Lemmings
