require 'rails_helper'

describe OmniauthCallbacksController do
  describe 'GET #google_oauth2' do
    let(:user) { create :user }

    def do_request
      get :google_oauth2
    end  

    before do 
      request.env['devise.mapping'] = Devise.mappings[:user]
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    context 'Success' do 
      it 'sign in user and redirect to the home page' do
        request.env["omniauth.auth"]['info']['email'] = user.email.capitalize
        do_request  
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'Successfully authenticated from Google account.'
      end
    end

    context 'Fail' do 
      it 'does not sign in user and alert an error message' do 
        do_request  
        expect(response).to redirect_to root_path
        expect(flash[:alert]).not_to be_nil
      end
    end
  end
end
