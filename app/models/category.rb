class Category < ActiveRecord::Base
  has_many :items, dependent: :nullify
end
