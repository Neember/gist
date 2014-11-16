require 'rails_helper'

describe 'display :show view' do
  let!(:snippet) { create(:snippet) }
  let!(:snippet_file) { create(:snippet_file, snippet: snippet )}

  it 'shows a snippet' do
    expect(page).not_to have_link('Edit',   { href: edit_snippet_path(snippet) })
    expect(page).not_to have_link('Delete',   { href: snippet_path(snippet) })

    login_as(snippet.user, :scope => :user)
    visit snippet_url(snippet)

    expect(page).to have_content(snippet.title)
    expect(page).to have_content(snippet_file.name)

    expect(page).to have_link('Edit',   { href: edit_snippet_path(snippet) })
    expect(page).to have_link('Delete',   { href: snippet_path(snippet) })
    expect(page).to have_link('Add more file',   { href: new_snippet_snippet_file_path(snippet) })

  end
end