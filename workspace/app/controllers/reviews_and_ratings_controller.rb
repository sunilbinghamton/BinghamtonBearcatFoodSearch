class ReviewsAndRatingsController < ApplicationController
  before_action :set_reviews_and_rating, :logged_in_user, only: [:show, :edit, :update, :destroy]

  # GET /reviews_and_ratings
  # GET /reviews_and_ratings.json
  def index
    @reviews_and_ratings = ReviewsAndRating.all
  end

  # GET /reviews_and_ratings/1
  # GET /reviews_and_ratings/1.json
  def show
  end

  # GET /reviews_and_ratings/new
  def new
    @reviews_and_rating = ReviewsAndRating.new
    session[:current_item] = @reviews_and_rating
  end

  # GET /reviews_and_ratings/1/edit
  def edit
  end

  # POST /reviews_and_ratings
  # POST /reviews_and_ratings.json
  def create
    @reviews_and_rating = ReviewsAndRating.new(reviews_and_rating_params)

    respond_to do |format|
      if @reviews_and_rating.save
        format.html { redirect_to @reviews_and_rating, notice: 'Reviews and rating was successfully created.' }
        format.json { render :show, status: :created, location: @reviews_and_rating }
      else
        format.html { render :new }
        format.json { render json: @reviews_and_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews_and_ratings/1
  # PATCH/PUT /reviews_and_ratings/1.json
  def update
    respond_to do |format|
      if @reviews_and_rating.update(reviews_and_rating_params)
        format.html { redirect_to @reviews_and_rating, notice: 'Reviews and rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviews_and_rating }
      else
        format.html { render :edit }
        format.json { render json: @reviews_and_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews_and_ratings/1
  # DELETE /reviews_and_ratings/1.json
  def destroy
    @reviews_and_rating.destroy
    respond_to do |format|
      format.html { redirect_to reviews_and_ratings_url, notice: 'Reviews and rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviews_and_rating
      @reviews_and_rating = ReviewsAndRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviews_and_rating_params
      params.fetch(:reviews_and_rating, {})
    end
end
