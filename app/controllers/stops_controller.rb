class StopsController < ApplicationController
  before_action :get_tour
  before_action :set_stop, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,except: [:home_about, :home_index, :home_stat]
  before_action :correct_user, only: [:edit, :update, :destroy]
 
  # GET /stops or /stops.json
  def index
    @stops = @tour.stops
    @hash = Gmaps4rails.build_markers(@stops) do |stop, marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
    end
   
  end

  # GET /stops/1 or /stops/1.json
  def show
  end

  # GET /stops/new
  def new
    @stop = @tour.stops.build
  end

  # GET /stops/1/edit
  def edit
  end

  # POST /stops or /stops.json
  def create
    @stop = @tour.stops.build(stop_params)

    respond_to do |format|
      if @stop.save
        format.html { redirect_to tour_path(@tour), notice: "Stop was successfully created." }
        format.json { render :show, status: :created, location: @stop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stops/1 or /stops/1.json
  def update
    respond_to do |format|
      if @stop.update(stop_params)
        format.html { redirect_to tour_path(@tour), notice: "Stop was successfully updated." }
        format.json { render :show, status: :ok, location: @stop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stops/1 or /stops/1.json
  def destroy
    @stop.destroy
    respond_to do |format|
      format.html { redirect_to tour_path(@tour), notice: "Stop was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  
  private
    # Use callbacks to share common setup or constraints between actions.
    def get_tour
      @tour = Tour.find(params[:tour_id])
    end
    def set_stop
      @stop = @tour.stops.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stop_params
      params.require(:stop).permit(:postition, :address, :latitude, :longitude, :arrival_date, :tour_id)
    end
end
