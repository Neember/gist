require 'rails_helper'

describe 'Create a snippet' do 
  let!(:user)  { create(:user) }

  it 'allows user to create a snippet' do 
    login_as(user, :scope => :user)
    visit new_snippet_url
    
    fill_in 'Title', with: 'Snippet 1'
    fill_in 'Content', with: 'Test Lorem Ipsum'
    click_on 'Create Snippet'
    expect(page).to have_content 'Snippet created successfully.'
  end
end