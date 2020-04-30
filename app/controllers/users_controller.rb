class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit]
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_one_month, only: [:show]

  def index
  end

  def show
    @first_day = Date.current.beginning_of_month
    @last_day = @first_day.end_of_month
  end
  
  def edit
  end
  
  private
    def user_find
      @user = User.find(params[:id])
    end
    
    def correct_user
      unless current_user.id == @user.id 
        redirect_to root_path, alert: "閲覧権限がありません"
      end
    end
end
