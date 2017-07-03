class FoodCourtsController < ApplicationController
  before_action :set_food_court, only: [:show, :edit, :update, :destroy]

  # GET /food_courts
  # GET /food_courts.json
  def index
    
    #@food_courts = FoodCourt.all
    @sort = params[:sort] || session[:sort]
    @food_court = FoodCourt.order(@sort)
    #puts "printing food courts",@food_court
    
    sort = params[:sort] || session[:sort]
    case sort
    when 'foodCourt'
      ordering,@foodCourt_header = {:foodCourt => :asc}, 'hilite'
    when 'distance'
      ordering,@distance_header = {:distance => :asc}, 'hilite'
    end
    #sort = params[:sort] || session[:sort]
    #case sort
    #when 'foodCourt'
    #  ordering,@title_header = {:foodCourt => :asc}, 'hilite'
    #when 'distance'
    #  ordering,@date_header = {:distance => :asc}, 'hilite'
    #end
  end

  # GET /food_courts/1
  # GET /food_courts/1.json
  def show
    id = params[:session][:id] 
    @food_court = FoodCourt.find(id) 
    #puts "printing food courts", @food_court.id
  end

  # GET /food_courts/new
  def new
    @food_court = FoodCourt.new
  end

  # GET /food_courts/1/edit
  def edit
        @food_court = FoodCourt.find params[:id]
  end

  # POST /food_courts
  # POST /food_courts.json
  def create
    @food_court = FoodCourt.new(food_court_params)

    respond_to do |format|
      if @food_court.save
        format.html { redirect_to @food_court, notice: 'Food court was successfully created.' }
        format.json { render :show, status: :created, location: @food_court }
      else
        format.html { render :new }
        format.json { render json: @food_court.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_courts/1
  # PATCH/PUT /food_courts/1.json
  def update
    respond_to do |format|
      if @food_court.update(food_court_params)
        format.html { redirect_to @food_court, notice: 'Food court was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_court }
      else
        format.html { render :edit }
        format.json { render json: @food_court.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_courts/1
  # DELETE /food_courts/1.json
  def destroy
    @food_court.destroy
    respond_to do |format|
      format.html { redirect_to food_courts_url, notice: 'Food court was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_court
      @food_court = FoodCourt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_court_params
      params.fetch(:food_court).permit(:foodCourt, :distance)
    end
end
