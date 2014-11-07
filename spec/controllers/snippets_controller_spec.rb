require 'rails_helper'

describe SnippetsController do 
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
      post :create, snippet: snippet.attributes
    end

    let!(:snippet) { build(:snippet) }

    context 'success' do
      it 'creates a snippet' do
        expect{do_request}.to change(Snippet, :count).by(1)
        expect(response).to redirect_to new_snippet_url
      end
    end

    context 'fail' do 
      it 'renders :new view' do 
        snippet.title = nil
        do_request
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    def do_request 
      get :edit, id: snippet.id
    end

    let!(:snippet) { create(:snippet) }

    it 'renders :edit view' do
      do_request
      expect(assigns(:snippet)).to match snippet
      expect(response).to render_template :edit
    end 
  end
end