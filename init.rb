$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'rubygems'
require 'bundler'
Bundler.setup

require "integrity"
require "integrity/notifier/campfire"

require 'uri'
database_url = ENV["DATABASE_URL"] || 'sqlite3:/Users/dkastner/ci1/integrity.db'
database_uri = URI.parse(database_url)
database_settings = {
  :adapter  => database_uri.scheme.to_sym,
  :host     => database_uri.host,
  :username => database_uri.user,
  :password => database_uri.password,
  :database => database_uri.path
}

Integrity.configure do |c|
  c.database     = database_url
  c.directory    = "/tmp"
  c.base_url     = ENV['URL'] || 'http://tests.brighterplanet.com'
  c.log          = "/tmp/integrity.log"
  c.github_token = ENV["GITHUB_TOKEN"] || "TOKEN"
  c.build_all    = true
  c.builder      = :dj, database_settings
  c.username     = ENV['HTTP_AUTH_USERNAME']
  c.password     = ENV['HTTP_AUTH_PASSWORD']
end
