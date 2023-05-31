class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @tool = Tool.find(params[:tool_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(confirmed: true)
    redirect_to @booking, notice: 'The Booking has been confirmed!'
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :rental_start, :rental_end)
  end
end
