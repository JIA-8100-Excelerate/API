class Goal < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates_presence_of :category, :student
  validates_uniqueness_of :category, :case_sensitive => false, :scope => :student
end
