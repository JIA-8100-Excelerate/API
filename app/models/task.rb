class Task < ApplicationRecord
  belongs_to :goal
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false, :scope => :goal_id
end
