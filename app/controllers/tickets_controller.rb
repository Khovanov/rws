class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = current_user.tickets.new(add_ticket_params)
  end

  def edit
  end

  def create
    @ticket = current_user.tickets.new(ticket_params.merge(add_ticket_params))
    if @ticket.save 
      redirect_to @ticket, notice: I18n.t('notices.ticket_created')
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: I18n.t('notices.ticket_updated')
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: I18n.t('notices.ticket_destroyed') 
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def add_ticket_params
    { train: @train, 
      start_station: @train.route.start_station, 
      end_station: @train.route.end_station } 
  end

  def ticket_params
    params.require(:ticket).permit(:full_name, :passport)
  end
end
