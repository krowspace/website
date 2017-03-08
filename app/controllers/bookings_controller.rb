class BookingsController < ApplicationController
  require 'Date'

  def new
    @booking = Booking.new
    @seat = booking_params[:seat_id]
    @from = booking_params[:start_date]
    @to = booking_params[:end_date]
  end

  # GET /krowspaces/1
  # GET /krowspaces/1.json
  def show
    @booking = Booking.find(confirm_booking_id['id'])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.start_date = Date.strptime(booking_params['start_date'], "%m/%d/%Y")
    @booking.end_date = Date.strptime(booking_params['end_date'], "%m/%d/%Y")
    if user_signed_in?
      @booking.user_id = current_user.id
    else
      @booking.user_id = 0
    end
    @booking.save
    redirect_to booking_path(@booking)
  end

  def confirm
    logger.debug confirm_booking_id
    @booking = Booking.update(confirm_booking_id['booking_id'], :active => true)
    redirect_to search_krowspaces_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def confirm_booking_id
    params.permit(:id, :booking_id)
  end

  def booking_params
    params.permit(:id,:firstName, :lastName, :company, :streetAddress, :city, :state, :zip, :licenseNumber, :licenseState, :paymentType, :cardName, :cardNumber, :expirationDate, :cvv, :email, :cost, :start_date, :end_date, :seat_id)
  end
# Never trust parameters from the scary internet, only allow the white list through.
end











