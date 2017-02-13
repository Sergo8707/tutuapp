class RailwayStationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time]

  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.' }
    end
  end

  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position])
    redirect_to @route
  end

  def update_time
    @route = Route.find(params[:route_id])
    arrival_time = "#{params[:arrival_time]['arrival_time(4i)']}:#{params[:arrival_time]['arrival_time(5i)']}"
    departure_time = "#{params[:departure_time]['departure_time(4i)']}:#{params[:departure_time]['departure_time(5i)']}"
    @railway_station.update_time(@route, arrival_time, departure_time)
    redirect_to @route
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:name)
  end
end
