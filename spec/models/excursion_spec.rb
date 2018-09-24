require 'rails_helper'

describe Excursion do
  context 'assocations in database' do
    it { should belong_to :destination }
    it { should belong_to :activity }
    it { should validate_presence_of :destination_id }
    it { should validate_presence_of :activity_id }
    it { should validate_presence_of :season }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
    it { should validate_numericality_of :destination_id }
    it { should validate_numericality_of :activity_id }
    it { should validate_numericality_of :price }
  end
end
