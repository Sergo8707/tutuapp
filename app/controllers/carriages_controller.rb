class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = type_class.all
  end

  def new
    @carriage = type_class.new
  end

  def show
  end

  def edit
  end

  def create
    @carriage = type_class.new(carriage_params)

    if @carriage.save
      redirect_to @carriage
    else
      render :new
    end
  end

  def update
    @carriage.calculate_total_seats
    if @carriage.update(carriage_params)
      redirect_to @carriage
    else
      render :new
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path
  end

  private

  def set_carriage
    @carriage = type_class.find(params[:id])
  end

  def type
    @type ||= Carriage::TYPES.include?(params[:type]) ? params[:type] : 'Carriage'
  end

  def type_class
    type.constantize
  end

  def carriage_params
    params.require(type.underscore.to_sym).permit(:number, :type, :train_id, :total_seats, :top_seats, :bottom_seats,
                                                  :side_top_seats, :side_bottom_seats, :seats)
  end
end
