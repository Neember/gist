require 'rails_helper'

describe Snippet do
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
  end

  describe 'associations' do 
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:tagables) }
    it { is_expected.to have_many(:tags).through(:tagables) }
  end

  describe '#belongs_to?' do 
    let!(:snippet) { create(:snippet) }

    context 'snippet belongs to the user' do 
      it 'returns true' do 
        expect(snippet.belongs_to?(snippet.user)).to eq true
      end
    end

    context 'snippet does not belong to the user' do 
      let!(:user) { create(:user) }
      
      it 'returns false' do 
        expect(snippet.belongs_to?(user)).to eq false
      end
    end
  end
end