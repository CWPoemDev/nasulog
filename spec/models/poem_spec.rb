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
      @poem_current = create(:poem, :one_hour_ago)
      @poem_next = create(:poem, :now)
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
      @poem_previous = create(:poem, :one_hour_ago)
      @poem_current = create(:poem, :now)
    end

    subject {
      @poem_current.previous
    }
    context 'present next poem' do
      it { is_expected.to eq @poem_previous }
    end
  end

  describe '.search' do
    let!(:nasu_poem) { create(:poem, title: '那須', description: 'がんばれよ！') }
    let!(:suzuki_poem) { create(:poem, title: '鈴木さん', description: 'やったぜ！') }
    let!(:iwaki_poem) { create(:poem, title: '岩木山', description: 'がんばれよ！那須さん') }
    before { sleep 1 } # elasticsearchにindexが反映されるのを少し待つ

    it 'キーワードに応じた検索結果が得られること' do
      aggregate_failures do
        expect(Poem.search(keywords: '那須').records.to_a).to include nasu_poem
        expect(Poem.search(keywords: 'がんばれ').records.to_a).to include nasu_poem, iwaki_poem
        expect(Poem.search(keywords: 'やったぜ').records.to_a).to include suzuki_poem
        expect(Poem.search(keywords: 'hoge').records.to_a).to eq []
      end
    end
  end
end
