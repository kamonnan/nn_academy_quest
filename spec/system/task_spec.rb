require 'rails_helper'

RSpec.describe "task", type: :system do
  before { driven_by(:selenium_chrome_headless) }


  it "allows user to mark a quest as completed" do
    Task.create!(content: "ซักผ้า", status: false)

    visit root_path
    find('input[type="checkbox"][data-testid^="checkbox-quest-"]', visible: :all).check

    expect(page).to have_css("label.line-through", text: "ซักผ้า")
  end

  it "allows user to delete a quest" do
    Task.create!(content: "ทำความสะอาด")

    visit root_path
    find('img[alt="Delete"]', visible: :all).click

    expect(page).to have_no_content("ทำความสะอาด")
  end
end
