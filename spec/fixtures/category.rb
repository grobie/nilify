class Category < ActiveRecord::Base
  nilify :title
  nilify :description
end