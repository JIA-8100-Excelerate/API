class User < ApplicationRecord
  has_secure_password
  has_many :goals, foreign_key: :student
  validates_presence_of :firstname, :lastname, :email, :password_digest
  validates_uniqueness_of :email
end
