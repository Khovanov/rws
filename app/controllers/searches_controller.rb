class SearchesController < ApplicationController

  def show
    @railway_stations = RailwayStation.all
    @routes = Route.search(search_params)
  end

  private

  def search_params
    params.permit(:start_station, :end_station)
  end
end
