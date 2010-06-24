$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'rubygems'
require 'bundler'
Bundler.setup

require "integrity"
require "integrity/notifier/campfire"

Integrity.configure do |c|
  c.database  ENV["DATABASE_URL"]
  c.directory "tmp"
  c.base_url  ENV["URL"]
  c.log       "tmp/integrity.log"
  c.github    ENV["GITHUB_TOKEN"] || "TOKEN"
  c.build_all = true
  c.builder      :threaded, 5
  c.user         ENV['HTTP_AUTH_USERNAME']
  c.pass         ENV['HTTP_AUTH_PASSWORD']
end
