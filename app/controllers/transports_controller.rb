class TransportsController < ApplicationController
  def create
    @transport = Transport.new(transport_params)
    @transport.travel = Travel.find(params[:travel_id])
    @transport.save
    redirect_to travel_path(params[:travel_id]) + "#transport-#{@transport.id}"
  end

  def destroy
    @transport = Transport.find(params[:id])
    @transport.destroy
    redirect_to travel_path(@transport.travel_id)
  end

  def update
    @transport = Transport.find(params[:id])
    @transport.update(transport_params)
    redirect_to travel_path(@transport.travel_id) + "#transport-#{@transport.id}"
  end

  private

  def transport_params
    params.require(:transport).permit(:address_departure, :address_arrival, :price, :duration, :means_of)
  end
end
