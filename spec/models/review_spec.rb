require 'rails_helper'

describe Review do
  context 'assocations in database' do
    it { should belong_to :destination }
    it { should belong_to :user }

  end
end
