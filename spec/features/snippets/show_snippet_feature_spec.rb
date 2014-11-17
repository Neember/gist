require 'rails_helper'

describe 'display :show view' do
  let!(:snippet) { create(:snippet) }

  it 'shows a snippet' do
    expect(page).not_to have_link('Edit',   { href: edit_snippet_path(snippet) })
    expect(page).not_to have_link('Delete',   { href: snippet_path(snippet) })

    login_as(snippet.user, :scope => :user)
    visit snippet_url(snippet)

    expect(page).to have_content(snippet.title)

    expect(page).to have_link('Edit',   { href: edit_snippet_path(snippet) })
    expect(page).to have_link('Delete',   { href: snippet_path(snippet) })
  end
end