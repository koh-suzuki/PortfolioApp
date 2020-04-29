class HealthsController < ApplicationController
  before_action :health_find, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # before_action :set_one_month, only: [:index]

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
    @health.update(health_params)
  end
  
  def destroy
  end
  
  private
    def health_find
      @health = Health.find(params[:id])
    end
    
    def health_params
    end
end
