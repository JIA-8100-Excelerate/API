class GoalSerializer < ActiveModel::Serializer
  attributes :id, :category, :student, :complete
  has_many :tasks
  has_many :completed_tasks
end
