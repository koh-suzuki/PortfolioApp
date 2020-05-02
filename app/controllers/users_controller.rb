class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit, :test_edit]
  before_action :health_find, only: [:edit]
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_one_month, only: [:show, :edit]

  def index
  end

  def show
    @health = current_user.healths.find_by(day: Date.today)
  end
  
  def edit
  end
  
  def test_edit
  end
  
  def edit_body
  end
  
  def edit_sleep
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
