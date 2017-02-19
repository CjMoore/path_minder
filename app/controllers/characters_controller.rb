class CharactersController < ApplicationController

  def new
    @character = Character.new
  end

  def create
    @user = current_user
    @character = current_user.characters.new(character_params)

    if @character.save
      flash[:notice] = "You've successfully created a new character"
      redirect_to combat_scenarios_path
    else
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  private

  def character_params
    params.require(:character).permit(:player_name, :name, :hit_points, :hit_points, :base_initiative, :race, :character_class)
  end
end
