source "http://rubygems.org"

gem "addressable", "2.1.1"
gem "bcrypt-ruby", "2.1.2"
gem "data_objects", "0.10.2"
gem "dm-aggregates", "1.0.0"
gem "dm-core", "1.0.0"
gem "dm-migrations", "1.0.0"
gem "dm-sqlite-adapter", "1.0.0"
gem "dm-timestamps", "1.0.0"
gem "dm-types", "1.0.0"
gem "dm-validations", "1.0.0"
gem "do_sqlite3", "0.10.2"
gem "extlib", "0.9.15"
gem "haml", "2.2.17"
gem "json", "1.1.9"
gem "rake"
gem "sinatra", "1.0.0"
gem "sinatra-authorization", "1.0.0"
gem "bcat", "~>0.5"
gem "thin"
gem "thor", "0.9.9"
gem "uuidtools", "2.1.1"

group :production do gem "dm-postgres-adapter", "1.0.0"
  gem 'sqlite3-ruby'
end

# These are dependencies for the various notifiers. Uncomment as appropriate.
# = Email
# gem "sinatra-ditties"
# = IRC
# gem "shout-bot"
# = Campfire
gem "broach"
gem "nap"

# = Dependencies for the :dj builder
# gem "activerecord"
# gem "sqlite3-ruby"
# gem "delayed_job", :git => "git://github.com/tobi/delayed_job.git"
# = Dependency for the :resque builder
# gem "resque"

# = Development dependencies.
group :test do
  gem "ruby-debug" if RUBY_VERSION < '1.9'
  gem "sqlite3-ruby"
  gem "delayed_job"
  gem "rr"
  gem "mocha"
  gem "redgreen"
  gem "dm-sweatshop"
  gem "ParseTree"
  gem "randexp"
  gem "rack-test", "0.5.0"
  gem "rumbster"
  gem "nokogiri"
  gem "hpricot"
  gem "contest"
  gem "webrat"
  gem "shout-bot"
  gem "sinatra-ditties"
  gem "bunny"
  gem "webmock"
  gem "turn"
end

group :prism_acceptance do
#  gem 'capybara'
  gem 'cucumber'
#  gem 'cucumber-rails'
  gem 'rspec', '~>2.0.0.beta.17'
#
#  # carbon gem
#  gem 'artifice'
#  gem 'carbon'
#  gem 'json', '1.1.9'
#  gem 'timecop'

#  gem 'activesupport', '~> 3.0.0'
#  gem 'activerecord', '~> 3.0.0'

  # emitter gems
#  gem 'earth', '~> 0.0.40'
#  gem 'emitter'
#  gem 'sniff', '~> 0.1.14'
end
