require 'rails_helper'

describe Review do
  context 'assocations in database' do
    it { should belong_to :destination }
    it { should belong_to :user }
    it { should validate_presence_of :rating }
    it { should validate_presence_of :content }
    it { should validate_presence_of :destination_id }
    it { should validate_numericality_of :rating }
    it { should validate_numericality_of :destination_id }
    it { should validate_numericality_of :user_id }
  end
end
