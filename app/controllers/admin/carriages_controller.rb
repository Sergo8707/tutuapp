class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @carriages = Carriage.all
  end

  def new
    @carriage = Carriage.new
  end

  def show; end

  def edit; end

  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to [:admin, @carriage]
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_carriages_url
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :type, :train_id, :total_seats, :top_seats, :bottom_seats,
                                     :side_top_seats, :side_bottom_seats, :seats)
  end
end
