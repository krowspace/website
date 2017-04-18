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
        where('(start_date <= ? AND end_date >= ?) or (start_date >= ? AND end_date <= ?)',
              Date.strptime(krowspace_params[:startDate], "%m/%d/%Y"), Date.strptime(krowspace_params[:endDate], "%m/%d/%Y"),
              Date.strptime(krowspace_params[:startDate], "%m/%d/%Y"), Date.strptime(krowspace_params[:endDate], "%m/%d/%Y")))
    @dates = {"startDate" => krowspace_params[:startDate], "endDate" => krowspace_params[:endDate]}
    @krowspaces = Krowspace.joins(:seats).where.not(id: Booking.select("seat_id").
        where('(start_date <= ? AND end_date >= ?) or (start_date >= ? AND end_date <= ?)',
              Date.strptime(krowspace_params[:startDate], "%m/%d/%Y"), Date.strptime(krowspace_params[:endDate], "%m/%d/%Y"),
              Date.strptime(krowspace_params[:startDate], "%m/%d/%Y"), Date.strptime(krowspace_params[:endDate], "%m/%d/%Y")))

  end
  private

  # Use callbacks to share common setup or constraints between actions.



  def krowspace_params
    params.permit(:location, :startDate, :endDate)
  end
# Never trust parameters from the scary internet, only allow the white list through.
end











