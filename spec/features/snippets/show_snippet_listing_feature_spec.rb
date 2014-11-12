require 'rails_helper'

describe 'Show snippet listing' do
  let!(:setup_rails)    { create(:snippet) }
  let!(:paperclip)      { create(:snippet) }

  it 'displays a list of snippets' do
    visit snippets_url
    expect(page).not_to have_link('Edit',   { href: edit_snippet_path(setup_rails) })
    expect(page).not_to have_link('Delete',   { href: snippet_path(setup_rails) })
    expect(page).not_to have_content('Gist Management')
    login_as(setup_rails.user, :scope => :user)
    visit snippets_url
    expect(page).to have_content('Gist Management')
    expect(page).to have_link('My Gists',  { href: snippets_path })
    expect(page).to have_link('Create a gist', { href: new_snippet_path })
    expect(page).to have_content setup_rails.title
    expect(page).not_to have_content paperclip.title
    expect(page).to have_link('Edit',   { href: edit_snippet_path(setup_rails) })
    expect(page).not_to have_link('Edit',   { href: edit_snippet_path(paperclip) })

    expect(page).to have_link('Delete',   { href: snippet_path(setup_rails) })
    expect(page).not_to have_link('Delete',   { href: snippet_path(paperclip) })

    expect(page).to have_link('Detail', { href: snippet_path(setup_rails) })
    expect(page).not_to have_link('Detail', { href: snippet_path(paperclip) })
  end
end