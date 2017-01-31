class Adminpanel::KrowspacesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_krowspace , only: [:show, :edit, :update, :destroy]
  # GET /krowspaces
  # GET /krowspaces.json
  def index
    @krowspaces = Krowspace.all
  end

  # GET /krowspaces/1
  # GET /krowspaces/1.json
  def show
  end

  # GET /krowspaces/new
  def new
    @krowspace = Krowspace.new
  end

  # GET /krowspaces/1/edit
  def edit
  end

  # POST /krowspaces
  # POST /krowspaces.json
  def create
    @krowspace = Krowspace.new(krowspace_params)
    respond_to do |format|
      if @krowspace.save
        @krowspace.seat_number.times do |i|
          s = Seat.new
          s.seat_number = i
          s.krowspace_id = @krowspace.id
          s.save
        end
        format.html { redirect_to adminpanel_krowspace_path(@krowspace), notice: 'Krowspace was successfully created.' }
        format.json { render :show, status: :created, location: @krowspace }
      else
        format.html { render :new }
        format.json { render json: @krowspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /krowspaces/1
  # PATCH/PUT /krowspaces/1.json
  def update
    respond_to do |format|
      if @krowspace.update(krowspace_params)
        format.html { redirect_to adminpanel_krowspace_path(@krowspace), notice: 'Krowspace was successfully updated.' }
        format.json { render :show, status: :ok, location: @krowspace }
      else
        format.html { render :edit }
        format.json { render json: @krowspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /krowspaces/1
  # DELETE /krowspaces/1.json
  def destroy
    @krowspace.destroy
    respond_to do |format|
      format.html { redirect_to krowspaces_url, notice: 'Krowspace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_krowspace
    @krowspace = Krowspace.find(params[:id])
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def krowspace_params
    params.require(:krowspace).permit(:name, :location, :seat_number, :active)
  end
# Never trust parameters from the scary internet, only allow the white list through.
end
