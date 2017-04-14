class Adminpanel::KrowspacesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_krowspace , only: [:createseats,:show, :edit, :update, :destroy]
  # GET /krowspaces
  # GET /krowspaces.json
  def createseats
  end

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
    baseURL = "http://maps.google.com/maps/api/geocode/json?address=#{@krowspace.street},#{@krowspace.city},#{@krowspace.state}"
    @result = JSON.parse(URI.parse(baseURL).read)
    @result['results'][0]['geometry']['location']['lat']
    @krowspace.lng = @result['results'][0]['geometry']['location']['lng']
    @krowspace.lat = @result['results'][0]['geometry']['location']['lat']
    respond_to do |format|
      if @krowspace.save
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
    params.require(:krowspace).permit(:name, :description, :active, :street, :city, :state, :zip, seats_attributes: [:id, :description, :done, :_destroy])
  end
# Never trust parameters from the scary internet, only allow the white list through.
end
