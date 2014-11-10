require 'rails_helper'

describe User do 
  describe '.find_for_oauth' do 
    let!(:auth) {
      {
        'provider' => 'github',
        'uid'      => '9523491',
        'info' => {
          'email' => nil,
          'image' => 'https://avatars.githubusercontent.com/u/9523491?v=3',
          'name'  => nil,
          'nickname'    => 'Johnytran',
          'created_at'  => '2014-11-03T02:42:47Z'
        },
        'extra' => {
          'raw_info' => {
            'name' => 'Johnytran'
          }
        }
      }
    }

    it 'returns a user' do
      expect(User.find_for_oauth(auth).username).to eq auth['info']['nickname']
    end
  end
end