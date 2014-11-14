require 'rails_helper'
require 'stubs/github_api'

describe SnippetPuller do 
  describe '#user_data' do 
    let!(:user) { create(:user, username: 'Johnytran') }

    it 'returns user data' do 
      puller = SnippetPuller.new(user)
      user_data = puller.user_data
      expect(user_data['login']).to eq user.username
    end
  end

  describe '#gists' do
    let(:user) { create(:user, username: 'Johnytran')}

    it 'return gists of user' do
      puller = SnippetPuller.new(user)
      gist_data = puller.gists
      expect(gist_data).to_not eq nil
    end
  end
end