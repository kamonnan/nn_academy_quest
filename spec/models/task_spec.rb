require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'is valid with a content' do
      task = Task.new(content: 'เรียนรู้ RSpec')
      expect(task).to be_valid
    end

    it 'is invalid without a title' do
      task = Task.new(content: nil)
      expect(task).not_to be_valid
      expect(task.errors[:content]).to include("ห้ามเว้นว่าง")
    end
  end
end
