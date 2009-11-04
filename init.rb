require 'nilify'

ActiveRecord::Base.send(:include, Grobie::Nilify)