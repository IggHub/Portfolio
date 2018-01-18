class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:edit, :show, :update, :destroy]
  layout 'experience'

  def index
    @experiences = Experience.all
  end

  def react
    @react_portfolio_items = Experience.react
  end

  def show
  end

  def new
    @experience = Experience.new
    3.times { @experience.technologies.build }
  end

  def create
    @experience = Experience.new(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to experiences_path, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experiences_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    #destroy action
    @experience.destroy
    #after-effect/ redirect
    respond_to do |format|
      format.html {redirect_to experiences_url, notice: 'Portfolio was removed'}
    end
  end

  private
  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                    )
  end
end
