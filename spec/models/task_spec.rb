require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'is valid with a content' do
      task = Task.new(content: 'เรียนรู้ RSpec')
      expect(task).to be_valid
    end
  end
end
