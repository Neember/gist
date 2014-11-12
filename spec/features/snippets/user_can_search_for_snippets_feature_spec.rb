require 'rails_helper'

describe 'User can search for snippet feature' do
  let!(:snippet) { create :snippet, title: 'RSpec for the win' }

  before { create :snippet, title: 'Capybara is the best' }

  it 'allows user to search for snippet' do
    visit root_path

    fill_in 'q', with: 'rspec'
    click_on 'Search'

    expect(page).to have_content snippet.title
    expect(page).not_to have_content 'Capybara'
  end
end