require 'rails_helper'
require 'stubs/github_api'

describe GithubApisController do
  describe 'GET #gists' do
    def do_request
      get :gists
    end
    
    let!(:user) { create(:user, username: 'Johnytran') }

    before { sign_in user}

    it "assigns an array of user's gists from github" do 
      do_request
      gists = assigns(:gists)
      expect(gists.size).to eq 1
      expect(gists.first['owner']['login']).to match user.username
      expect(response).to render_template :gists
    end
  end
end