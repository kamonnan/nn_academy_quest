# app/models/task.rb
class Task < ApplicationRecord
  validates :content, length: { maximum: 100 }
  attribute :completed, :boolean, default: false
end
