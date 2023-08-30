class BirdsController < ApplicationController
 
  def index
    birds = Bird.all
    render json: birds
  end

  
  def show
    bird = Bird.find(params[:id])
    render json: bird
  end

  
  def create
    bird = Bird.new(bird_params)
    if bird.save
      render json: bird, status: :created
    else
      render json: { errors: bird.errors.full_messages }, status: :unprocessable_entity
    end
  end

  
  def update
    bird = Bird.find(params[:id])
    if bird.update(bird_params)
      render json: bird
    else
      render json: { errors: bird.errors.full_messages }, status: :unprocessable_entity
    end
  end

  
  def destroy
    bird = Bird.find(params[:id])
    bird.destroy
    head :no_content
  end

  private

  def bird_params
    params.require(:bird).permit(:name, :species, :color)
  end
end