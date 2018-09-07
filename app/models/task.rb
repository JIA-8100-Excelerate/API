class Task < ApplicationRecord
  belongs_to :goal
  serialize :students, Array
  validates_presence_of :name
end
