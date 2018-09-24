require 'rails_helper'

describe Destination do
  context 'assocations in database' do
    it { should have_many :reviews }
    it { should have_many :excursions }
    it { should have_many(:activities).through(:excursions)}
  end
end
