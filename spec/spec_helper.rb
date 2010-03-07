require "rubygems"
require "spec"
require "sqlite3"
require "active_record"

# load nilify
require File.dirname(__FILE__) + '/../init'

# establish database connection, define schema and load model
ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database  => ':memory:'
ActiveRecord::Migration.verbose = false

%w(schema category post user specialized_user).each do |file|
  require File.dirname(__FILE__) + "/fixtures/#{file}"
end
