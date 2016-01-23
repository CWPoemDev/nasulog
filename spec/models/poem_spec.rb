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

  describe '#my_poem?' do
    let(:poem) { create(:poem) }
    subject { user.my_poem?(poem) }
    context 'when the poem is user poem' do
      let(:user) { poem.user }
      it { is_expected.to eq true }
    end
    context 'when the poem is not user poem' do
      let(:user) { create(:user) }
      it { is_expected.to eq false }
    end
  end

  describe '#next' do
    before do
      @poem_current = create(:poem)
      @poem_next = create(:poem)
    end

    subject {
      @poem_current.next
    }
    context 'present next poem' do
      it { is_expected.to eq @poem_next }
    end
  end

  describe '#previous' do
    before do
      @poem_previous = create(:poem)
      @poem_current = create(:poem)
    end

    subject {
      @poem_current.previous
    }
    context 'present next poem' do
      it { is_expected.to eq @poem_previous }
    end
  end
end
