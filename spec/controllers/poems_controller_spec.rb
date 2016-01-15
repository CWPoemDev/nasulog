require 'rails_helper'

RSpec.describe PoemsController, type: :controller do
  describe 'GET #show' do
    let(:poem) { create(:poem) }
    subject { get :show, id: poem.id }

    context 'before login' do
      it { is_expected.to redirect_to(root_path) }
    end
  end

  describe 'GET #show', login_as: :current_user do
    let(:poem) { create(:poem) }
    let(:current_user) { create(:user) }
    subject { get :show, id: poem.id }

    context 'afer login' do
      it { is_expected.to be_success }
    end
  end
end
