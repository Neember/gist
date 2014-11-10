require 'rails_helper'

describe Tag do 
  describe 'validations' do 
    it { is_expected.to validate_presence_of :title}
  end

  describe 'associations' do 
    it { is_expected.to have_many(:tagables) }
    it { is_expected.to have_many(:snippets).through(:tagables) }
  end
end