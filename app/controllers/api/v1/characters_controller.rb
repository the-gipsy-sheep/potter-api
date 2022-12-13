class Api::V1::CharactersController < ApplicationController
  before_action :set_character, only: %i[show update destroy]

  def index
    @characters = Character.all
    render json: @characters.to_json(only: %i[id name review actor image_url]), status: 200
  end

  def show
    if @character
      render json: @character.to_json(only: %i[id name review actor image_url]), status: 200
    else
      render json: {status: 404, message: "Character not found"}, status: 404
    end
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      render json: @character, status: 201
    else
      render json: { status: 422, error: 'Error creating character'}, status: :unprocesable_entity
    end
  end

  def update
    if @character
      @character.update(character_params)
      render json: { message: 'Record updated!' }, status: 200
    else
      render json: { status: 404, message: "Character not found"}, status: 404
    end
  end

  def destroy
    if @character
      @character.destroy
      render json: { message: 'Record deleted!' }, status: 200
    else
      render json: { status: 404, message: "Character not found"}, status: 404
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :review, :actor, :image_url)
  end

  def set_character
    @character = Character.find_by_id(params[:id])
  end
end
