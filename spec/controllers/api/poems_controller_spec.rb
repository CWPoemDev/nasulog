require 'rails_helper'

RSpec.describe Api::PoemsController, type: :controller do
  context 'after login', login_as: :current_user do
    let(:current_user) { create(:user) }
    before do
      current_user.poems.create(title:"スマホっていいね", description:"アプリのAPIを作るのは楽しい")
    end

    describe '/api/poems' do
      subject { get :index, format: :json }
      it { is_expected.to be_success }
    end
  end
end
