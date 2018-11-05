class CompletedTask < ApplicationRecord
  belongs_to :goal
  validates_presence_of :name
end
