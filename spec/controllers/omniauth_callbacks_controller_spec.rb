require 'rails_helper'

describe OmniauthCallbacksController do
  describe 'GET #github' do
    let(:user) { create :user }

    def do_request
      get :github
    end  

    before do 
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
    end

    context 'Success' do 
      it 'sign in user and redirect to the home page' do
        request.env["omniauth.auth"]['info']['email'] = user.email
        do_request  
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Successfully authenticated from Github account.'
      end
    end

    context 'Fail' do 
      it 'does not sign in user and alert an error message' do 
        do_request  
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Can not find the user!'
      end
    end
  end
end