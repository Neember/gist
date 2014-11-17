require 'rails_helper'

describe 'User can share a snippet feature' do
  let(:user) { create :user }
  let!(:snippet) { create :snippet, user: user }

  it 'allows user to share' do
    login_as user, scope: :user
    visit root_path

    click_on snippet.title

    click_on 'Share'

    fill_in 'Email', with: 'john@example.com'
    click_on 'Share to this email'

    expect(page).to have_content 'Snippet was shared successfully to john@example.com'
  end
end