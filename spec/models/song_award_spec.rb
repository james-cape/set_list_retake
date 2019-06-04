require 'rails_helper'

RSpec.describe SongAward, type: :model do
  describe 'validations' do
    describe 'relationships' do
      it { should belong_to :song }
      it { should belong_to :award }
    end
  end
end
