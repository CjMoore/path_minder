class CreaturesController < ApplicationController

  def new
    @combat_scenario = CombatScenario.find(params[:combat_scenario_id])
    @creature = Creature.new
  end

  def create
    @combat_scenario = CombatScenario.find(params[:combat_scenario_id])
    @creature = @combat_scenario.creatures.new(creature_params)

    if @creature.save
      redirect_to combat_scenario_path(@combat_scenario)
    else
      render :new
    end
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def edit
    @combat_scenario = CombatScenario.find(params[:combat_scenario_id])
    @creature = Creature.find(params[:id])
  end

  def update
    @combat_scenario = CombatScenario.find(params[:combat_scenario_id])
    @creature = Creature.find(params[:id])

    if @creature.update_attributes(creature_params)
      redirect_to combat_scenario_path(@combat_scenario)
    else
      render :edit
    end
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :creature_name, :count, :creature_type, :hit_points, :traits, :will_save, :reflex_save, :fortitude_save, :perception, :base_initiative)
  end
end
