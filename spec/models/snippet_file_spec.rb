require 'rails_helper'

describe SnippetFile do 
  describe 'Validations' do 
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :snippet_id }
  end

  describe 'Associations' do 
    it { is_expected.to belong_to :snippet }
  end
end