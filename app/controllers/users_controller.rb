class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit]
  before_action :health_find, only: [:edit, :show]
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_one_month, only: [:show, :edit]

  def index
  end

  def show
    
  end
  
  def edit
  end
  
  private
    def user_find
      @user = User.find(params[:id])
    end
    
    def health_find
      @health = Health.find(params[:id])
    end
    
    def correct_user
      unless current_user.id == @user.id 
        redirect_to root_path, alert: "閲覧権限がありません"
      end
    end
end
