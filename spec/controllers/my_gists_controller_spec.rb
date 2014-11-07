require 'rails_helper'

describe MyGistsController do 
  describe 'GET #new' do 
    def do_request 
      get :new
    end

    it 'renders the :new view' do 
      do_request
      expect(response).to render_template :new
    end
  end
  describe 'POST #create' do
    def do_request
      post :create, my_gist: gist.attributes
    end

    let!(:gist) { build(:my_gist) }

    context 'success' do
      it 'creates a gist' do
        expect{do_request}.to change(MyGist, :count).by(1)
        expect(response).to redirect_to new_my_gist_url
      end
    end

    context 'fail' do 
      it 'renders :new view' do 
        gist.title = nil
        do_request
        expect(response).to render_template :new
      end
    end
  end
end