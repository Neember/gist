require 'rails_helper'
require 'stubs/github_api'

describe 'show gist github listing' do
  let(:user) { create(:user, username: 'Johnytran') }

  it 'displays list of gist pulled from github' do
    login_as(user, :scope => :user)
    puller = SnippetPuller.new(user)
    gist_data = puller.gists
    visit root_path
    click_on 'Gists on Github'
    
    expect(page).to have_content gist_data[0]['files']['SETUP RAILS']['filename']
  end
end
