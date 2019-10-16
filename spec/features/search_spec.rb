require 'rails_helper'

RSpec.describe "Searchin" do
  it "can search by house" do
    visit '/'

    select 'Gryffindor', from: "house"

    click_on "Search For Members"

    expect(current_path).to eq(search_path)
    expect(page).to have_css('.member', count: 21)
    expect(all('.member').length).to eq(21)
    expect(page).to have_content("21 results")

    within(first('.member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.role')
      expect(page).to have_css('.house')
      expect(page).to have_css('.patronus')
    end
  end
end
