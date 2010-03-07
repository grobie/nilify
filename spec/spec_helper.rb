require "rubygems"
require "spec"
require "sqlite3"
require "active_record"

# load nilify
require File.dirname(__FILE__) + '/../init'

# establish database connection, define schema and load model
ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database  => ':memory:'
ActiveRecord::Migration.verbose = false
require File.dirname(__FILE__) + '/fixtures/schema'
require File.dirname(__FILE__) + '/fixtures/user'
require File.dirname(__FILE__) + '/fixtures/specialized_user'
require File.dirname(__FILE__) + '/fixtures/category'