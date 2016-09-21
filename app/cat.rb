require_relative '../lib/model_base'

class Cat < ModelBase
  finalize!
  belongs_to :human,
    foreign_key: :owner_id
  has_one_through :house, :human, :house
end

class Human < ModelBase
  Human.table_name = 'humans'
  finalize!
  belongs_to :house
  has_many :cats,
    foreign_key: :owner_id
end

class House < ModelBase
  finalize!
  has_many :humans
end

p Cat.columns
p Cat.find(1)
p Human.find(1)
p Cat.find(1).house
