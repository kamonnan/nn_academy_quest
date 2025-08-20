# app/models/task.rb
class Task < ApplicationRecord
  attribute :completed, :boolean, default: false
end
