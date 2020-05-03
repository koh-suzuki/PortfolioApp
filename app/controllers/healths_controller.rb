class HealthsController < ApplicationController
  before_action :user_id, only: [:edit, :edit_body, :update_body, :edit_sleep, :update_sleep, 
                                 :edit_water, :update_water, :edit_goal, :update_goal]
  before_action :health_find, only: [:edit, :update, :destroy, :edit_body, :update_body,
                                     :edit_sleep, :update_sleep, :edit_water, :update_water,
                                     :edit_goal, :update_goal]
  before_action :authenticate_user!

  def index
    @first_day = Date.current.beginning_of_month
    @last_day = @first_day.end_of_month
  end

  def show
    
  end

  def new
    @health = Health.new
  end
  
  def create
    @health = Health.create(health_params)
    if @health.save
      redirect_to 
    else
    end
  end

  def edit
  end
  
  def update
    
  end
  
  def edit_body
  end
  
  def update_body
    if @health.update(health_body_params)
      redirect_to  user_path @user, notice: "体情報を登録しました。"
    else
      render :edit_body, alert: "体情報の登録に失敗しました。"
    end
  end

  def edit_sleep
  end
  
  def update_sleep
    if @health.update(health_sleep_params)
      redirect_to  user_path @user, notice: "睡眠情報を登録しました。"
    else
      render :edit_sleep, alert: "睡眠情報の登録に失敗しました。"
    end
  end

  def edit_water
  end
  
  def update_water
    if @health.update(health_water_params)
      redirect_to  user_path @user, notice: "水分情報を登録しました。"
    else
      render :edit_water, alert: "水分情報の登録に失敗しました。"
    end
  end

  def edit_goal
  end
  
  def update_goal
    if @health.update(health_goal_params)
      redirect_to  user_path @user, notice: "水分情報を登録しました。"
    else
      render :edit_goal, alert: "水分情報の登録に失敗しました。"
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
end
