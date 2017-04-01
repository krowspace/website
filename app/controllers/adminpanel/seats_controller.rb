class Adminpanel::SeatsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  # GET /krowspaces/new
  def new
    @seat = set_krowspace.seats.new
  end


  # POST /krowspaces
  # POST /krowspaces.json
  def create
    @seat = set_krowspace.seats.new(seat_params)
    respond_to do |format|
      if @seat.save
        format.html { redirect_to adminpanel_krowspace_path(@krowspace), notice: 'Krowspace was successfully created.' }
        format.json { render :show, status: :created, location: @krowspace }
      else
        format.html { render :new }
        format.json { render json: @krowspace.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_krowspace

    @krowspace = Krowspace.find(params[:krowspace_id])
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def seat_params
    params.require(:seat).permit(:seat_number)
  end
# Never trust parameters from the scary internet, only allow the white list through.
end
