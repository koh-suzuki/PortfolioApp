class HealthsController < ApplicationController
  before_action :user_id, only: [:edit, :edit_body, :update_body, :edit_sleep, :update_sleep, 
                                 :edit_water, :update_water, :edit_goal, :update_goal,
                                 :edit_day, :update_day
                                 ]
  before_action :health_find, only: [:edit, :update, :destroy, :edit_body, :update_body,
                                     :edit_sleep, :update_sleep, :edit_water, :update_water,
                                     :edit_goal, :update_goal, :edit_day, :update_day
                                     ]
  before_action :authenticate_user!


  def edit
    @profile = Profile.find_by(id: current_user.id)
  end
  
  def update
    
  end
  
  def edit_body
  end
  
  def update_body
    if @health.update(health_body_params)
      flash[:notice] = "体情報を登録しました。"
      redirect_to  user_path @user
    else
      flash[:alert] =  "体情報の登録に失敗しました。"
      render :edit_body
    end
  end

  def edit_sleep
  end
  
  def update_sleep
    if @health.update(health_sleep_params)
      flash[:notice] = "睡眠情報を登録しました。"
      redirect_to  user_path @user
    else
      flash[:alert] = "睡眠情報の登録に失敗しました。"
      render :edit_sleep
    end
  end

  def edit_water
  end
  
  def update_water
    if @health.update(health_water_params)
      flash[:notice] = "水分情報を登録しました。"
      redirect_to  user_path @user
    else
      flash[:alert] = "水分情報の登録に失敗しました。"
      render :edit_water
    end
  end

  def edit_goal
  end
  
  def update_goal
    if @health.update(health_goal_params)
      flash[:notice] = "目標情報を登録しました。"
      redirect_to  user_path @user
    else
      flash[:alert] = "目標情報の登録に失敗しました。"
      render :edit_goal
    end
  end
  
  def edit_day
  end
  
  def update_day
    if @health.update_attributes!(health_day_params)
      flash[:notice] = "更新しました。"
      redirect_to  user_path @user
    else
      flash[:alert] = "更新に失敗しました。"
      redirect_to user_path @user
    end
  end
  
  def destroy
  end
  
  private
    def user_id 
      health = Health.find_by(user_id: current_user.id)
      @user = health.user_id
    end
    
    def health_find
      @health = Health.find(params[:id])
    end
    
    def health_body_params
      params.require(:health).permit(:weight, :body_fat, :bowel_movement)
    end
    
    def health_sleep_params
      params.require(:health).permit(:bedtime_at, :getuptime_at)
    end

    def health_water_params
      params.require(:health).permit(:water)
    end

    def health_goal_params
      params.require(:health).permit(:weight_goal, :body_fat_goal)
    end
    
    def health_day_params
      params.require(:health).permit(:weight, :body_fat, :bedtime_at, :getuptime_at,
                                     :bowel_movement, :water)
    end
end
