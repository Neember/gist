require 'rails_helper'

describe 'Create a gist' do 
  it 'allows user to create a gist' do 
    visit new_my_gist_url
    fill_in 'Title', with: 'Gist 1'
    fill_in 'Content', with: 'Gist 1 content'
    click_on 'Create My gist'
    expect(page).to have_content 'Gist created successfully.'
  end
end