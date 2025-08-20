require 'rails_helper'

RSpec.describe "task", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "allows user to add a new quest" do
    visit root_path

    fill_in "Add your task!", with: "กินข้าวกับแม่"
    find('[data-testid="submit-quest"]').click

    expect(page).to have_content("กินข้าวกับแม่")
  end

  it "allows user to mark a quest as completed" do
    Task.create!(content: "ซักผ้า", status: false)

    visit root_path
    find('input[type="checkbox"][data-testid^="checkbox-quest-"]', visible: false).check

    expect(page).to have_css("label.line-through", text: "ซักผ้า")
  end

  it "allows user to delete a quest" do
    Task.create!(content: "ทำความสะอาด")

    visit root_path

    # กดปุ่มลบโดยตรง ไม่ต้อง confirm
    find('img[alt="Delete"]').click

    expect(page).to have_no_content("ทำความสะอาด")
  end
end
