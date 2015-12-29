class HomeController < ApplicationController
  before_filter :login_required

  def index
    #ユーザ一覧を表示してポエムを更新している人が一番上に上がる。投稿したポエムのタイトルが表示される
    @users = User.all.joins(:poem).order(created_at: :desc).uniq
  end
end
