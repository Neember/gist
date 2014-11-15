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

  
end