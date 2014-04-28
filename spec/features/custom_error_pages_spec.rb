require 'spec_helper'

feature "custom error pages" do
  scenario "when I requests a route that does not exist" do
    visit "/bullocks"
    expect(page).to have_content "Sorry"
    expect(page).to have_content "Cannot find a route to /bullocks"
  end

  scenario "when I request a model that does not exist" do
    visit provider_path('foo')
    expect(page).to have_content "Provider could not be found"
    expect(page).to have_content "Sorry, could not find provider with the ID or SLUG 'foo'"
  end
end