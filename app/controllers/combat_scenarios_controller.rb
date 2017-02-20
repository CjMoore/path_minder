class CombatScenariosController < ApplicationController

  def new
    @combat_scenario = CombatScenario.new
  end

  def create
    @combat_scenario = current_user.combat_scenarios.new(combat_params)
    if @combat_scenario.save
      flash[:notice] = "You've created a new combat scenario"
      redirect_to combat_scenarios_path
    else
      render :new
    end
  end

  def index
    @combat_scenarios = current_user.combat_scenarios
  end

  def show
    @combat_scenario = CombatScenario.find(params[:id])
    @user = @combat_scenario.user
  end

  def edit
    @combat_scenario = CombatScenario.find(params[:id])
  end

  def update
    @combat_scenario = CombatScenario.find(params[:id])

    if @combat_scenario.update_attributes(combat_params)
      redirect_to combat_scenario_path(@combat_scenario)
      flash[:notice] = "You've successfully edited a combat scenario. "
    else
      render :edit
    end
  end

  def destroy
    # @user = current_user
    @combat_scenario = CombatScenario.find(params[:id])
    @combat_scenario.destroy
    flash[:notice] = "You have sucessfully deleted a scenario"

    redirect_to combat_scenarios_path
  end

  def new_character
    @combat_scenario = CombatScenario.find(params[:combat_scenario_id])
    @character = Character.new
  end

  def characters_index
  end

  def remove
    @combat_scenario = CombatScenario.find(params[:combat_scenario_id])
    @character = Character.find(params[:id])
    @combat_scenario.characters.delete(@character)

    redirect_to combat_scenario_path(@combat_scenario)
  end

  private

  def combat_params
    params.require(:combat_scenario).permit(:name, character_ids: [])
  end
end
