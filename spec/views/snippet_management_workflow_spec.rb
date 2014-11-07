require 'rails_helper'

describe 'Create a snippet' do 
  it 'allows user to create a gist' do 
    visit new_snippet_url
    fill_in 'Title', with: 'Snippet 1'
    fill_in 'Content', with: 'Snippet 1 content'
    click_on 'Create Snippet'
    expect(page).to have_content 'Snippet created successfully.'
  end
end