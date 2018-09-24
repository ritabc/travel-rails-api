require 'rails_helper'

describe Excursion do
  context 'assocations in database' do
    it { should belong_to :destination }
    it { should belong_to :activity }
  end
end
