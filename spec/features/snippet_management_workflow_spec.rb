require 'rails_helper'

describe 'Create a snippet' do 
  it 'allows user to create a snippet' do 
    visit new_snippet_url
    fill_in 'Title', with: 'Snippet 1'
    fill_in 'Content', with: 'Snippet 1 content'
    click_on 'Create Snippet'
    expect(page).to have_content 'Snippet created successfully.'
  end
end

describe 'Update a snippet' do 
  let!(:snippet) { create(:snippet) }

  it 'allows user to update a snippet' do
    visit edit_snippet_url(snippet) 
    fill_in 'Title', with: 'New title'
    click_on 'Update Snippet'
    expect(page).to have_content 'Snippet updated successfully.'
  end
end

describe 'Show snippet listing' do
  let!(:setup_rails)    { create(:snippet) }
  let!(:paperclip)      { create(:snippet) }

  it 'displays a list of snippets' do
    visit snippets_url
    expect(page).to have_content setup_rails.title
    expect(page).to have_content paperclip.title
    expect(page).to have_link('Edit',   { href: edit_snippet_path(setup_rails) })
    expect(page).to have_link('Detail', { href: snippet_path(paperclip) })
  end
end