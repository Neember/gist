require 'rails_helper'

describe 'Update a snippet' do 
  let!(:snippet) { create(:snippet) }

  it 'allows user to update a snippet' do
    login_as(snippet.user, :scope => :user)
    visit edit_snippet_url(snippet) 
    fill_in 'Title', with: 'New title'
    fill_in 'Content', with: 'Lorem Ipsum'
    click_on 'Update Snippet'
    expect(page).to have_content 'Snippet updated successfully.'
  end
end