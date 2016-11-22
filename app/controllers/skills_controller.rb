class SkillsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_skill, only: [:show]

  def index

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
  end

  private

  def skill_params
    params.require(:skill).permit(:title,:photo,:price_per_hour, :photo_cache, :description, :category, :location)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
