class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(params.require(:experience).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @experience.save
        format.html { redirect_to experiences_path, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
end
