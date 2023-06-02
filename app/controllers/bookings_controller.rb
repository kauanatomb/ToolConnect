class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :accept, :edit, :update, :destroy]
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
    @tool = Tool.find(params[:tool_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @tool = Tool.find(params[:tool_id])
    @booking.user = current_user
    @booking.tool = @tool
    @booking.save
    redirect_to bookings_path
  end

  def accept
    @booking.status = 'accepted'
    @booking.save
    redirect_to bookings_path
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :rental_start, :rental_end)
  end
end
