ENV['DATABASE_URL'] ||= "sqlite://#{Dir.pwd}/tmp/prism_ci.db"
ENV['URL'] ||= "http://localhost:3000"
ENV['GITHUB_TOKEN'] ||= "token"
ENV['HTTP_AUTH_USERNAME'] ||= "test"
ENV['HTTP_AUTH_PASSWORD'] ||= "test"
require "init"
run Integrity.app
