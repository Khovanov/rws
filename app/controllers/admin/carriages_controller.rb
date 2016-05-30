class Admin::CarriagesController < Admin::BaseController
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
      redirect_to [:admin, @train], notice: I18n.t('notices.carriage_created') 
    else
      render :new
    end    
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to [:admin, @carriage.train], notice: I18n.t('notices.carriage_updated')
    else
      render :edit
    end
  end

  def destroy
    train = @carriage.train
    @carriage.destroy
    redirect_to [:admin, train], notice: I18n.t('notices.carriage_destroyed')
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
