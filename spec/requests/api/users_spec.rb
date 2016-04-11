require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  let(:current_user) { nil }

  before(:each) do
    allow_any_instance_of(Api::ApplicationController).to receive(:current_user).and_return current_user
    allow_any_instance_of(Api::ApplicationController).to receive(:login_required).and_return true
  end

  describe 'GET /api/user/auth_token' do
    subject { get auth_token_api_user_path }

    context '非ログイン' do
      it "トークンの取得はできない" do
        subject
        expect(response).to have_http_status(401)
      end
    end

    context 'ログイン済み' do
      let (:current_user) { create(:user) }

      it "トークンが取得可能" do
        subject
        expect(response).to have_http_status(200)
      end

      #TODO 取得したトークンでログインできるか、も見たい・・・
    end
  end

end
