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
    @user = @character.user
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])

    if @character.update_attributes(character_params)
      flash[:notice] = "You've successfully updated a character"
      redirect_to user_character_path(current_user, @character)
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    flash[:notice] = "You've successfully deleted #{@character.name}"

    redirect_to combat_scenarios_path
  end
  private

  def character_params
    params.require(:character).permit(:player_name, :name, :hit_points, :hit_points, :base_initiative, :race, :character_class)
  end
end
