require 'rails_helper'

describe Snippets::SnippetFilesController do 
  describe 'GET #new' do 
    def do_request 
      get :new, snippet_id: snippet.id
    end

    let!(:snippet) { create(:snippet) }

    before { sign_in(snippet.user) }

    it 'renders :new view' do 
      do_request
      expect(response).to render_template :new
    end
  end

  describe 'POST#create' do 
    let(:snippet) { build(:snippet) }
    let(:snippet_file) { build(:snippet_file) }
    let(:user) { snippet.user }

    before { sign_in user }
    def do_request
      post :create, snippet_file: snippet_file.attributes, snippet_id: snippet.id
    end
    context 'success' do
       it 'create a snippet_file' do
        expect(do_request).to change(Snippet_file :count).by(1)
        expect(assign(:snippet_file)).to match snippet_file
        expect(response).to redirect_to my_gists_snippets_path
      end
    end
   context 'fails' do
     it 'redirect to :new view' do
       do_request
       snippet_file.name = nil
       expect(response).to render_template :new
     end
   end
  end
end