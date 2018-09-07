class Goal < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates_presence_of :category, :student
end
