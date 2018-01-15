class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def react
    @react_portfolio_items = Experience.react
  end

  def show
    @experience = Experience.find(params[:id])
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
    @experience = Experience.find(params[:id]) #params is URI
  end

  def update
    @experience = Experience.find(params[:id])

    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experiences_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    #lookup
    @experience = Experience.find(params[:id])
    #destroy action
    @experience.destroy
    #after-effect/ redirect
    respond_to do |format|
      format.html {redirect_to experiences_url, notice: 'Portfolio was removed'}
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                    )
  end
end
