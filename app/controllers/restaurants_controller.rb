class RestaurantsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :require_admin, :except => [:index, :show, :create_review, :delete_review]

  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurant_review = Review.new
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, :notice => 'Restaurant was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, :notice => 'Restaurant was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
    end
  end

  def create_review
    @restaurant = Restaurant.find_by_id(params[:review][:restaurant_id])
    @review = Review.create(params[:review])
    redirect_to restaurant_path(@restaurant), :notice => 'Review was successfully submitted.'
  end

  def delete_review
    @review = Review.find_by_id(params[:review_id])
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to restaurant_path(@restaurant), :notice => 'Review was successfully deleted.'
  end
end
