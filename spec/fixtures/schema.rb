ActiveRecord::Schema.define do
  
  create_table :users, :force => true do |t|
    t.column  :name,          :string
    t.column  :not_null,      :string
    t.column  :salary,        :integer
    t.column  :birthday,      :datetime
  end
  
  create_table :posts, :force => true do |t|
    t.column  :name,          :string
  end
  
end