class ActivitiesController < ApplicationController
  def create
    @activity = Activity.new(params_activity)
    @travel = Travel.find(params[:travel_id])
    @activity.travel = @travel
    @activity.save
    redirect_to travel_path(params[:travel_id]) + "#activity-#{@activity.id}"
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(params_activity)
    redirect_to travel_path(@activity.travel_id) + "#activity-#{@activity.id}"
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to travel_path(@activity.travel_id)
  end

  private

  def params_activity
    params.require(:activity).permit(:address, :name, :price, :duration)
  end
end
