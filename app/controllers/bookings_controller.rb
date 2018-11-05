class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @bookings = current_user.bookings.decorate
      render :index
    else
      redirect_to root_path
    end
  end

  def show
    @flight = @booking.flight
  end

  def search
    @booking = Booking.search(search_params)
    @flight = @booking.flight if @booking
    render :show
  end

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
  end

  def edit
    @flight = @booking.flight
    render :new
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        mail_passengers
        format.html do
          redirect_to @booking,
                      notice: "Booking was successfully created."
        end
        format.json { render :show, status: :created, location: @booking }
      else
        @flight = @booking.flight
        format.html { render :new }
        format.json do
          render json: @booking.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def mail_passengers
    passengers = @booking.passengers
    passengers.each do |passenger|
      BookingMailer.success(passenger, @booking).deliver_now
    end
  end

  def update
    @flight = @booking.flight
    respond_to do |format|
      if @booking.update(booking_params)
        format.html do
          redirect_to @booking,
                      notice: "Booking was successfully updated."
        end
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :new }
        format.json do
          render json: @booking.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html do
        redirect_to bookings_url,
                    notice: "Booking was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  def search_params
    params.permit(:code)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id]).decorate
  end

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      :user_id,
      passengers_attributes: [:id, :name, :email, :address, :phone, :_destroy]
    )
  end
end
