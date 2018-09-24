require 'rails_helper'

describe Activity do
  context 'assocations in database' do
    it { should have_many :excursions }
    it { should have_many(:destinations).through(:excursions)}
  end
end
