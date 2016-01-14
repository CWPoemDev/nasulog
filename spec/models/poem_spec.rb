require 'rails_helper'

RSpec.describe Poem, type: :model do
  describe 'validations' do
    let(:user) { FactoryGirl.create :user }

    context 'when required attributes missing' do
      subject { Poem.new }

      it { is_expected.to have_at_least(1).errors_on :title }
      it { is_expected.to have_at_least(1).errors_on :description }
    end

    context 'when given attribute values' do
      subject { Poem.new(user_id: user.id, title: 'test', description: 'testing') }

      it { is_expected.to be_valid }
    end
  end
end
