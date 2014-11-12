require 'rails_helper'

describe 'Destroy a snippet' do
  let!(:snippet) { create(:snippet) }

  it 'deletes a snippet' do 
    login_as(snippet.user, :scope => :user)
    visit snippets_url
    click_on 'Delete'
    expect(page).to have_content 'Snippet deleted successfully.'
  end
end