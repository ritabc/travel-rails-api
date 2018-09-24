require 'rails_helper'

describe User do
  context 'assocations in database' do
    it { should have_many :reviews }
    it { validate_presence_of :email }
    it { validate_presence_of :password }
    it { validate_uniqueness_of :email }

  end
end
