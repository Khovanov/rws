class CarriagesController < ApplicationController
  before_action :set_train, only: [:new, :create]
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save 
      redirect_to @train, notice: "Carriage was successfully created." 
    else
      render :new
    end    
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage.train, notice: "Carriage was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    train = @carriage.train
    @carriage.destroy
    redirect_to train, notice: "Carriage was successfully destroyed."
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, 
                                     :train_id, 
                                     :top_seats, 
                                     :bottom_seats,
                                     :side_top_seats, 
                                     :side_bottom_seats, 
                                     :type)
  end

end
