class SkillsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = []
    if params["category"] == "All categories"
      @skills = Skill.all
    else
      @skills = Skill.all.where(category: params["category"])
    end
  end

  def edit
  end

  def update
    @skill.update(skill_params)
    @skill.save
    redirect_to skill_path(@skill)
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = @user
    if @skill.save
      redirect_to skill_path(@skill)
    else
      render :new
    end
  end

  def show
    @user = @skill.user
    @skill_hash = CATEGORIES_PHOTOS.select { |hash| hash[:category] == @skill.category }
    @image_id = @skill_hash[0][:photo_filepath]
  end

  def destroy
    @skill.active = false
    @skill.save
    redirect_to user_path(current_user)
  end

  private

  def skill_params
    params.require(:skill).permit(:active, :title, :photo, :price_per_hour, :photo_cache, :description, :category, :location)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
