class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  def index
    @trains = Train.all
  end

  # GET /trains/1
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  def create
    @train = Train.new(train_params)

      if @train.save
        redirect_to [:admin, @train]
      else
        render :new
      end
  end

  # PATCH/PUT /trains/1
  def update
      if @train.update(train_params)
        redirect_to [:admin, @train], notice: 'Train was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /trains/1
  def destroy
    @train.destroy
      redirect_to admin_trains_url, notice: 'Train was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :current_station_id, :carriage_order)
  end
end
