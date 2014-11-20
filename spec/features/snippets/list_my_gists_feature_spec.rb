require 'rails_helper'

describe 'Show My Gists listing' do
  let!(:setup_rails)    { create(:snippet) }
  let!(:paperclip)      { create(:snippet) }

  it 'displays a list of snippets' do
    login_as(setup_rails.user, scope: :user)

    visit my_gists_snippets_url
    expect(page).to have_content setup_rails.title
    expect(page).not_to have_content paperclip.title
    
    expect(page).to have_link('Edit', { href: edit_snippet_path(setup_rails) })
    expect(page).not_to have_link('Edit', { href: edit_snippet_path(paperclip) })

    expect(page).to have_link('Delete', { href: snippet_path(setup_rails) })
    expect(page).not_to have_link('Delete', { href: snippet_path(paperclip) })

    expect(page).to have_link(setup_rails.title, { href: snippet_path(setup_rails) })
    expect(page).not_to have_link(paperclip.title, { href: snippet_path(paperclip) })
  end
end
