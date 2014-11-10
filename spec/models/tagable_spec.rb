require 'rails_helper'

describe Tagable do 
  describe 'validations' do 
    it { is_expected.to validate_presence_of :snippet }
    it { is_expected.to validate_presence_of :tag }
  end

  describe 'associations' do 
    it { is_expected.to belong_to :snippet }
    it { is_expected.to belong_to :tag }
  end
end