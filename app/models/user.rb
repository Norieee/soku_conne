class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :pro_users

  japanese_letters = /\A[ぁ-んァ-ン一-龥]+\z/
  with_options presence: true do
    validates :last_name, format: { with: japanese_letters, message: 'is not full-width characters' }
    validates :first_name, format: { with: japanese_letters, message: 'is not full-width characters' }
    validates :email, uniqueness: { case_sensitive: true },
               format: { with: /\w+([-+.]\w+)*@\w+([-.]\w+)*/ }
    validates :password, length: {minimum: 6 },
               format: { with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+\z/, message: 'includes both half-width letters and half-width numbers' }
    validates :company, :password_confirmation
  end
end