class KrowspacesController < ApplicationController
  before_action :set_krowspace , only: [:show]
  # GET /krowspaces
  # GET /krowspaces.json
  def index
  end

  # GET /krowspaces/1
  # GET /krowspaces/1.json
  def show
  end

  def search
    @seats = Seat.paginate(:page => params[:page],:per_page => 5).where.not(id: Booking.select("seat_id").
    where('(start_date <= ? AND end_date >= ?) or (start_date <= ? AND end_date >= ?)',
    krowspace_params[:startDate], krowspace_params[:endDate], krowspace_params[:startDate], krowspace_params[:endDate])) 
  end
  private

  # Use callbacks to share common setup or constraints between actions.

  def krowspace_params

    params.permit(:location, :startDate, :endDate)
  end
# Never trust parameters from the scary internet, only allow the white list through.
end











