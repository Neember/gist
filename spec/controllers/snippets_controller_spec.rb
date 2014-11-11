require 'rails_helper'

describe SnippetsController do 
  describe 'GET #new' do 
    def do_request 
      get :new
    end

    let!(:user) { create(:user) }

    before { sign_in user }

    it 'renders the :new view' do 
      do_request
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let!(:snippet)  { build(:snippet) }
    let!(:user)     { create(:user) }

    before { sign_in user }

    def do_request
      post :create, snippet: snippet.attributes
    end

    context 'success' do
      it 'creates a snippet' do
        expect{do_request}.to change(Snippet, :count).by(1)
        expect(response).to redirect_to snippets_url
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
    let!(:snippet)  { create(:snippet) }

    before { sign_in user } 

    def do_request 
      get :edit, id: snippet.id
    end

    context 'snippet belongs to current user' do 
      let!(:user) { snippet.user }

      it 'renders :edit view' do
        do_request
        expect(snippet.user_id).to eq user.id
        expect(assigns(:snippet)).to match snippet
        expect(response).to render_template :edit
      end 
    end

    context 'snippet does not belong to current user' do 
      let!(:user) { create(:user) }

      it 'renders :edit view' do
        do_request
        expect(response).to redirect_to snippets_url
      end 
    end
  end

  describe 'PUT #update' do
    let!(:snippet)      { create(:snippet) }
    let(:update_params) { attributes_for(:snippet, title: new_title) }

    before { sign_in user } 

    def do_request
      put :update, { id: snippet.id, snippet: update_params }
    end

    context 'Snippet belong to user' do
      let!(:user) { snippet.user }
      context 'with valid attributes' do
        let(:new_title) { 'New Title' }

        it "changes @snippet's attributes" do
          do_request
          snippet.reload
          expect(snippet.title).to eq new_title
          expect(response).to redirect_to snippet_url(snippet)
        end
      end

      context 'with invalid attributes' do
        let(:new_title) { nil }

        it "does not change @snippet's attributes" do
          do_request
          snippet.reload
          expect(snippet.title).to_not eq new_title
          expect(response).to render_template :edit
        end
      end
    end

    context 'Snippet does not belong user' do
      let(:new_title) { 'New Title' }
      let!(:user)     { create(:user) }

      it 'redirect to snippet listing page' do
        do_request
        expect(response).to redirect_to snippets_url
      end
    end
  end

  describe 'GET #show' do 
    def do_request 
      get :show, id: snippet.id 
    end

    let!(:snippet)   { create(:snippet) }

    it 'assigns snippet to @snippet and renders :show view' do 
      do_request 
      expect(assigns(:snippet)).to match snippet 
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    def do_request
      get :index
    end

    let!(:snippets) { create_list(:snippet, 2) }

    it 'assigns an array of snippets and renders :index view' do 
      do_request 
      expect(assigns(:snippets).size).to eq 2
      expect(response).to render_template :index
    end
  end

  describe 'DELETE #destroy' do
    def do_request 
      delete :destroy, id: snippet.id
    end

    let!(:snippet) { create(:snippet) }
    let!(:user)    { create(:user) }

    before { sign_in user } 

    it 'deletes a snippet' do
      expect{do_request}.to change(Snippet, :count).by(-1)
      expect(response).to redirect_to snippets_url 
    end
  end
end