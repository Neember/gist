require 'rails_helper'

describe Snippet do
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end

  describe 'associations' do 
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:tagables) }
    it { is_expected.to have_many(:tags).through(:tagables) }
  end
end