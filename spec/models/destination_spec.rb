require 'rails_helper'

describe Destination do
  context 'assocations in database' do
    it { should have_many :reviews }
    it { should have_many :excursions }
    it { should have_many(:activities).through(:excursions) }
    it { should validate_presence_of :country }
    it { should validate_presence_of :city }
    it { should validate_presence_of :description }
  end
end
