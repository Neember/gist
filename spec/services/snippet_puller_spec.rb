require 'rails_helper'

describe SnippetPuller do 
  describe '#user_data' do 
    let!(:user) { create(:user, username: 'Johnytran') }

    it 'returns user data' do 
      puller = SnippetPuller.new(user)
      user_data = puller.user_data
      expect(user_data['login']).to eq user.username
    end
  end
end