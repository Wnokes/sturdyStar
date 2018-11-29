class Message

  include ActiveModel::Model
  attr_accessor :name, :company, :email, :project_description, :budget
  validates :name, :email, :project_description, presence: true
end
