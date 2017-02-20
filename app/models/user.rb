class User < ApplicationRecord
  has_secure_password

  validates :username, :password, :email, presence: true
  validates :username, :email,  uniqueness: true

  enum role: ['default', 'admin']

  has_many :combat_scenarios, dependent: :destroy
  has_many :characters
end
