require 'rails_helper'

RSpec.describe Api::MarkdownPreviewsController, type: :controller do
  describe 'Post #create', login_as: :current_user do
    let(:current_user) { create(:user) }
    let(:text) { 'hogehoge :octocat:' }
    subject { post :create, text: text, format: :json }
    it 'octocatのimage_pathがrenderされてかえること' do
      is_expected.to be_success
      expect(response.body).to eq controller.view_context.markdown(text)
    end
  end
end
