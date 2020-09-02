class Project < ApplicationRecord
  has_many :messages
  has_many :pro_users
  has_many :users, through: :pro_users
end
