class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit]
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_one_month, only: [:show, :edit]

  def index
    
  end

  def show
    @health = @user.healths.find_by(day: Date.today)
    @user = Health.find_by(user_id: current_user.id)
  end
  
  def edit
    @health = @user.healths.find_by(day: Date.today)
    @user = Health.find_by(user_id: current_user.id)
  end
  
  private
    
    def correct_user
      unless current_user.id == @user.id 
        redirect_to root_path, alert: "閲覧権限がありません"
      end
    end
end
