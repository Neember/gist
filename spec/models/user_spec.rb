require 'rails_helper'

describe User do
  describe '.create_with_omniauth' do 
    let!(:auth) { 
      {
        'provider' => 'github',
        'uid' => '9523491',
        'info' => {
          'name' => nil,
          'nickname' => 'Johnytran',
          'email' => 'tuananhasp@gmail.com',
          'image' => 'https://avatars.githubusercontent.com/u/9523491?v=2'
          }
      } 
    }

    it 'creates a user with omniauth' do 
      User.create_with_omniauth(auth)
      expect(User.count).to eq 1
    end
  end
end
