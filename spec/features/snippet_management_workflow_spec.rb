require 'rails_helper'

describe 'Create a snippet' do 
  let!(:user)  { create(:user) }

  it 'allows user to create a snippet' do 
    login_as(user, :scope => :user)
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
    login_as(snippet.user, :scope => :user)
    visit edit_snippet_url(snippet) 
    fill_in 'Title', with: 'New title'
    click_on 'Update Snippet'
    expect(page).to have_content 'Snippet updated successfully.'
  end
end

describe 'Destroy a snippet' do
  let!(:snippet) { create(:snippet) }

  it 'deletes a snippet' do 
    login_as(snippet.user, :scope => :user)
    visit snippets_url
    click_on 'Delete'
    expect(page).to have_content 'Snippet deleted successfully.'
  end
end

describe 'Show snippet listing' do
  let!(:setup_rails)    { create(:snippet) }
  let!(:paperclip)      { create(:snippet) }

  it 'displays a list of snippets' do
    visit snippets_url
    expect(page).not_to have_link('Edit',   { href: edit_snippet_path(setup_rails) })
    expect(page).not_to have_link('Delete',   { href: snippet_path(setup_rails) })
    login_as(setup_rails.user, :scope => :user)
    visit snippets_url
    expect(page).to have_link('Gist Listing',  { href: snippets_path })
    expect(page).to have_link('Create a gist', { href: new_snippet_path })
    expect(page).to have_content setup_rails.title
    expect(page).to have_content paperclip.title
    expect(page).to have_link('Edit',   { href: edit_snippet_path(setup_rails) })
    expect(page).not_to have_link('Edit',   { href: edit_snippet_path(paperclip) })

    expect(page).to have_link('Delete',   { href: snippet_path(setup_rails) })
    expect(page).not_to have_link('Delete',   { href: snippet_path(paperclip) })

    expect(page).to have_link('Detail', { href: snippet_path(paperclip) })
  end
end