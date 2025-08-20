# app/models/task.rb
class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 100 }
  attribute :completed, :boolean, default: false
end
