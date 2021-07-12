class ToursController < ApplicationController
  before_action :set_tour, only: %i[ show edit update destroy]
  before_action :authenticate_user!,except: [:home_about, :home_index, :home_stat]
  before_action :correct_user, only: [:edit, :update, :destroy]


  # GET /tours or /tours.json
  def index
    @tours = Tour.all
    if params[:search_by_autista] && params[:search_by_autista] != ""
      @tours = @tours.where("Autista like ?", 
      "%#{params[:search_by_autista]}%")
    end
    if params[:search_by_partenza] && params[:search_by_partenza] != ""
      @tours = @tours.where("Partenza like ?", 
      "%#{params[:search_by_partenza]}%")
    end
    if params[:search_by_destinazione] && params[:search_by_destinazione] != ""
      @tours = @tours.where("destinazione like ?", 
      "%#{params[:search_by_destinazione]}%")
    end
    if params[:search_by_data] && params[:search_by_data] != ""
      @tours = @tours.where("data like ?", 
      "%#{params[:search_by_data]}%")
    end
  end
  
 
  # GET /tours/1 or /tours/1.json
  def show
    @comments = @tour.comments.all
    @comment = @tour.comments.build
  end
 

  # GET /tours/new
  def new
    #@tour = Tour.new
    @tour = current_user.tours.build

  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours or /tours.json
  def create
    #@tour = Tour.new(tour_params)
    @tour = current_user.tours.build(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: "Tour was successfully created." }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1 or /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: "Tour was successfully updated." }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1 or /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: "Tour was successfully destroyed." }
      format.json { head :no_content }
    end
  end



def join
  @tour = Tour.find(params[:id])
  @m = @tour.memberships.build(:user_id => current_user.id)
  respond_to do |format|
    if @m.save
      format.html { redirect_to(@tour, :notice => 'You have joined this Tour.') }
      format.xml  { head :ok }
    else
      format.html { redirect_to(@tour, :notice => 'Join error.') }
      format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
    end
  end
end

def remove_from_tour
  @tour = Tour.find(params[:id]) #can do that in before_filter
  @membership = @tour.memberships.find_by(tour_id: params[:id], user_id: current_user.id)
  if @membership
    @membership.destroy
    flash[:notice] = "Removed membership."
    redirect_to @tour
  else
    flash[:notice] = "No membership Found."
    redirect_to @tour
  end
  
end


def correct_user
  @tour = current_user.tours.find_by(id: params[:id])
  redirect_to tours_path, notice:"Not Autorized To Edit This Tour" if @tour.nil?
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

 

    # Only allow a list of trusted parameters through.
    def tour_params
      params.require(:tour).permit(:Autista, :Mezzo_Di_Trasporto, :Data, :Partenza, :destinazione, :durata, :Posti_Disponibili,:user_id)
    end
end
