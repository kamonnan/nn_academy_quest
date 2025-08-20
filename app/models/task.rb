# app/models/task.rb
class Task < ApplicationRecord
  validates :content, presence: true
  attribute :completed, :boolean, default: false
end
