require 'spec_helper'

describe 'the brands and individual brand path', {:type => :feature} do
  it 'displays all the brands' do
    visit '/brands'
    expect(page).to have_content 'Brands'
  end

  it 'adds a new brand' do
    visit '/brands'
    fill_in 'Brand name', with: 'Yike'
    click_button 'Add Brand'
    expect(page).to have_content 'Yike'
  end

  it 'adds a store to carry the brand' do
    brand = Brand.create({name: 'Yike'})
    visit '/brands'
    click_link 'Yike'
    fill_in 'Store Name', with: 'Xappos'
    click_button 'Add New Store'
    expect(page).to have_content 'Xappos'
  end
end