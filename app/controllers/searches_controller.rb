class SearchesController < ApplicationController
  def show
    @result = Search.find_route_trains(search_params)
  end

  def index

  end

  private

  def search_params
    params.require(:search).permit(:first_station_id, :last_station_id)
  end
end