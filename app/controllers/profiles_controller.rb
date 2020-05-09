class ProfilesController < ApplicationController
  before_action :user_id, only: [:edit, :update]
  before_action :profile_id, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :profile_correct_user
  
  def edit
    @profile = Profile.find_by(id: current_user.id, user_id: current_user.id)
  end
  
  def update
    if @profile.update(profile_goal_params)
      flash[:notice] = "目標情報を登録しました。"
      redirect_to  user_path @user
    else
      flash[:alert] = "目標情報の登録に失敗しました。"
      render :edit
    end
  end
  
  private
    def user_id 
      health = Health.find_by(user_id: current_user.id)
      @user = health.user_id
    end
    
    def profile_id
      @profile = Profile.find(params[:id])
    end
   
    def profile_goal_params
      params.require(:profile).permit(:weight_goal, :body_fat_goal)
    end
    
    def profile_correct_user
      unless current_user.id == @profile.user_id
        redirect_to root_path, alert: "閲覧権限がありません"
      end
    end
end
