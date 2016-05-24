class Sti::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  def index
    # @carriages = Carriage.all
    @carriages = sti_class.all
  end 

  def show
  end

  def new
    # @carriage = Carriage.new
    @carriage = sti_class.new
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save 
      redirect_to [:sti, @carriage], notice: "#{type_params} was successfully created." 
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to [:sti, @carriage], notice: "#{type_params} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to sti_carriages_path, notice: "#{type_params} was successfully destroyed."
  end 

  private

  def set_carriage 
    # @carriage = Carriage.find(params[:id])
    @carriage = sti_class.find(params[:id])
  end

  def carriage_params
    # params.require(:carriage).permit(:number, :train_id, :top_seats, :bottom_seats, :type)
    params.require(type_params.underscore.to_sym).permit(:number, 
                                                         :train_id, 
                                                         :top_seats, 
                                                         :bottom_seats,
                                                         :side_top_seats, 
                                                         :side_bottom_seats, 
                                                         :type)
  end

  def set_type
    @type = type_params
  end

  def type_params
    Carriage.types.include?(params[:type]) ? params[:type] : "Carriage"
  end

  def sti_class
    type_params.constantize
  end
end
