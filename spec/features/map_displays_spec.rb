require 'rails_helper'


describe "loading the root map", type: :feature do
  it "shows a map", js: true do
    visit "/"
    expect(page).to have_selector('.leaflet-container')
  end
end

describe "load bus routes", type: :feature do
  it "shows bus routes on the map", js: true do
    visit "/"
    expect(page).to have_selector('path')
  end
end

