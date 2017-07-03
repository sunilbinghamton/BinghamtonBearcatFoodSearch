class MenuListsController < ApplicationController
  before_action :set_menu_list, only: [:show, :edit, :update, :destroy]

  # GET /menu_lists
  # GET /menu_lists.json
  def index
    #@sort = params[:sort]
    #@menu_list = MenuList.order(@sort)
    #Rails.logger.debug("debug::" + params[:id])
    
    @menu_list = MenuList.all
    #@menu_lists = MenuList.where(rating: @selected_ratings.keys).order(ordering)
    
   # @menu_list = MenuList.where(foodCourt: params[:session][:foodCourt])
    #@menu_list = MenuList.find(params[id])
  end

  # GET /menu_lists/1
  # GET /menu_lists/1.json
  def show
    #@outlet_name = SELECT  "food_courts".foodCourt FROM "food_courts" WHERE "food_courts"."id" = ? LIMIT 1 [["id", params[:id]];
    #puts("name "+@outlet_name)
    @idMenu = params[:id]
    @menu_list = MenuList.where(outlet_id: @idMenu)
    #@menu_list = MenuList.all
    # retrieve movie ID from URI route
    #@menu_list = MenuList.find(id)
    #@menu_list = MenuList.where(outlet_id: params[:id])
    #redirect_to menu_lists_path
  end

  # GET /menu_lists/new
  def new
    @menu_lists = MenuList.new
  end

  # GET /menu_lists/1/edit
  def edit
  end

  # POST /menu_lists
  # POST /menu_lists.json
  def create
    #@menu_lists = MenuList.new(menu_list_params)
    @menu_lists = MenuList.create!(menu_list_params)
    respond_to do |format|
      if @menu_lists.save
        format.html { redirect_to @menu_lists, notice: 'Menu list was successfully created.' }
        format.json { render :show, status: :created, location: @menu_lists }
      else
        format.html { render :new }
        format.json { render json: @menu_lists.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_lists/1
  # PATCH/PUT /menu_lists/1.json
  def update
    respond_to do |format|
      if @menu_lists.update(menu_list_params)
        format.html { redirect_to @menu_lists, notice: 'Menu list was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_lists }
      else
        format.html { render :edit }
        format.json { render json: @menu_lists.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_lists/1
  # DELETE /menu_lists/1.json
  def destroy
    @menu_lists.destroy
    respond_to do |format|
      format.html { redirect_to menu_lists_url, notice: 'Menu list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_list
      @menu_lists = MenuList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_list_params
      params.require(:menu_lists).permit(:menu_item, :price)
    end
end
