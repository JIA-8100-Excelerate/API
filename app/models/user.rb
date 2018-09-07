class User < ApplicationRecord
  has_secure_password
  has_many :goals, foreign_key: :student
  validates_presence_of :name, :email, :password_digest
end
