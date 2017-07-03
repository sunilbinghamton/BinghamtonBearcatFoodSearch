class FoodOutletsController < ApplicationController
  before_action :set_food_outlet, only: [:show, :edit, :update, :destroy]

  # GET /food_outlets
  # GET /food_outlets.json
  def index
    @food_outlets = FoodOutlet.all
    
  end

  # GET /food_outlets/1
  # GET /food_outlets/1.json
  def show
    
    @idOutlet = params[:id]
    @food_outlets = FoodOutlet.where(outletId:@idOutlet)
    
  end

  # GET /food_outlets/new
  def new
    @food_outlet = FoodOutlet.new
  end

  # GET /food_outlets/1/edit
  def edit
  end

  # POST /food_outlets
  # POST /food_outlets.json
  def create
    @food_outlet = FoodOutlet.new(food_outlet_params)

    respond_to do |format|
      if @food_outlet.save
        format.html { redirect_to @food_outlet, notice: 'Food outlet was successfully created.' }
        format.json { render :show, status: :created, location: @food_outlet }
      else
        format.html { render :new }
        format.json { render json: @food_outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_outlets/1
  # PATCH/PUT /food_outlets/1.json
  def update
    respond_to do |format|
      if @food_outlet.update(food_outlet_params)
        format.html { redirect_to @food_outlet, notice: 'Food outlet was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_outlet }
      else
        format.html { render :edit }
        format.json { render json: @food_outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_outlets/1
  # DELETE /food_outlets/1.json
  def destroy
    @food_outlet.destroy
    respond_to do |format|
      format.html { redirect_to food_outlets_url, notice: 'Food outlet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_outlet
      @food_outlet = FoodOutlet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_outlet_params
      params.fetch(:food_outlet, {})
    end
end
