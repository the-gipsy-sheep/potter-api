class CharactersController < ApplicationController
  before_action :set_character, only: %i[show update destroy]

  def index
    @characters = Character.all
    render json: @characters.to_json(only: %i[id name review image_url]), status: 200
  end

  def show
    if @character
      render json: @character, status: 200
    else
      render json: {status: 404, message: "Character not found"}, status: 404
    end
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
    @character = Character.find_by_id(params[:id])
  end
end
