class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show; end

  def new
    @railway_station = RailwayStation.new
  end

  def edit; end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station]
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_station_path, notice: I18n.t('controllers.railway_stations.updated')
    else
      render :edit
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_url
  end

  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position])
    redirect_to [:admin, @route]
  end

  def update_time
    @route = Route.find(params[:route_id])
    arrival_time = "#{params[:arrival_time]['arrival_time(4i)']}:#{params[:arrival_time]['arrival_time(5i)']}"
    departure_time = "#{params[:departure_time]['departure_time(4i)']}:#{params[:departure_time]['departure_time(5i)']}"
    @railway_station.update_time(@route, arrival_time, departure_time)
    redirect_to [:admin, @route]
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:name)
  end
end
