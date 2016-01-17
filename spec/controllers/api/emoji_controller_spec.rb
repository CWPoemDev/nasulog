require 'rails_helper'

RSpec.describe Api::EmojiController, type: :controller do
  # :FIXME APIのテストなのでrequest specが適当らしい。誰か書きなおしてください
  describe 'Get #index', login_as: :current_user do
    let(:current_user) { create(:user) }
    subject { get :index, query: emoji_name, format: :json }
    context '絞込した場合' do
      let(:emoji_name) { 'octocat' }
      it 'oktocatとoktocatのurlを含むJSONがかえること' do
        is_expected.to be_success
        json = JSON.parse(response.body)
        emoji = Emoji.find_by_alias(emoji_name)
        expect(json.first['value']).to eq emoji_name
        expect(json.first['url']).to eq controller.view_context
          .emoji_path(emoji)
      end
    end
    context '絞り込んでいない場合' do
      let(:emoji_name) { '' }
      it '10件のemoji情報を含むJSONがかえること' do
        is_expected.to be_success
        json = JSON.parse(response.body)
        expect(json.length).to eq 10
      end
    end
  end
end
