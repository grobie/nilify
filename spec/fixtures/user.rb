class User < ActiveRecord::Base
  nilify :name, :salary, :birthday
end