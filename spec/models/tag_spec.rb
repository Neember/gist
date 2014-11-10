require 'rails_helper'

describe Tag do 
  describe 'validations' do 
    it { is_expected.to validate_presence_of :title}
  end
end