require 'rubygems'
require 'bundler'

require 'pry'

require 'turn/autorun'
require 'minitest/spec'
require 'minitest/matchers'

Turn.config.format = :outline

require_relative '../lib/lemmings'
include Lemmings
