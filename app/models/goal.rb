class Goal < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :completed_tasks
  validates_presence_of :category, :student
  validates_uniqueness_of :category, :case_sensitive => false, :scope => :student
end
