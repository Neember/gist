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

    it 'returns gists of user' do
      puller = SnippetPuller.new(user)
      gist_data = puller.gists
      expect(gist_data).to_not eq nil
    end
  end

  describe '#gist' do 
    let(:code) { '55599a17e859093bc085' }
    
    it 'return gist info' do
      gist_info = SnippetPuller.gist(code)
      expect(gist_info['id']).to eq code
    end
  end

  describe '#pull' do
    let!(:user) { create(:user, username: 'Johnytran') }
    let!(:code) { '55599a17e859093bc085' }

    it 'pulls the gist to snippet' do
      ##puller = SnippetPuller.new(user)
      ##expect(puller.pull(code)).to change(Snippet, :count).by(1)
    end
  end
end