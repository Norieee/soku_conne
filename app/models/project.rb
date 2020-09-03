class Project < ApplicationRecord
  has_many :pro_users
  has_many :users, through: :pro_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end