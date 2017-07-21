require 'spec_helper'

describe 'the stores and individual store path', {:type => :feature} do
  it 'displays all the stores' do
    visit '/stores'
    expect(page).to have_content 'Stores'
  end

  it 'adds a new store' do
    visit '/stores'
    fill_in 'Store name', with: 'Xappos'
    click_button 'Add Store'
    expect(page).to have_content 'Xappos'
  end

  it 'adds a brand to the store' do
    store = Store.create({name: 'Xappos'})
    visit '/stores'
    click_link 'Xappos'
    fill_in 'Brand Name', with: 'Yike'
    click_button 'Add New Brand'
    expect(page).to have_content 'Yike'
  end

  it 'updates store name' do
    store = Store.create({name: 'Xappos'})
    visit '/stores'
    click_link 'Xappos'
    fill_in 'New Name', with: 'Yappos'
    click_button 'Update Store'
    expect(page).to have_content 'Yappos'
  end

  it 'deletes a store' do
    store = Store.create({name: 'Xappos'})
    visit '/stores'
    click_link 'Xappos'
    click_button 'Delete Store'
    expect(page).to have_content 'Stores'
  end
end