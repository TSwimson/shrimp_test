require 'rubygems'
require 'bundler'
require 'open-uri'
require 'tempfile'

Bundler.require

Shrimp.configure do |c|
  c.rendering_time = 1
end
