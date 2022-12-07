class CharactersController < ApplicationController
  before_action :set_character, only: %i[show update destroy]

  def index
    @characters = Character.all
    render json: @characters
  end

  def show
  end

  def create
    @character = Character.new(character_params)
    if @character.save
    else
    end
  end

  def update
    @character.update(character_params)
  end

  def destroy
    @character.destroy
  end

  private

  def character_params
    params.require(:character).permit(:name, :review, :actor, :image_url)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
