class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit]
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_one_month, only: [:show, :edit]

  def index
    
  end

  def show
    # 今日の体情報
    @health = @user.healths.find_by(day: Date.current)
    # 本番環境でgoogle認証した場合にprofileを生成
    @user = Health.find_by(user_id: current_user.id)
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.blank?
      @profile = Profile.new
      @profile.id = current_user.id
      @profile.user_id = current_user.id
      @profile.save
    end
    # グラフ
    @user_data = @healths.where.not(weight: nil)
    weights = @healths.pluck(:weight)
    unless weights.all?(&:nil?)
      @min = weights.compact.min - 10
      @max = weights.compact.max + 10
    end
  end
  
  def edit
    @health = @user.healths.find_by(day: Date.today)
    @user = Health.find_by(user_id: current_user.id)
  end
end
