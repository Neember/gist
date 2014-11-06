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
end