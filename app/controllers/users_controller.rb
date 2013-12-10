class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :require_admin, :only => [:index]

  def index
    @users = User.order("id DESC")
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Your profile has been updated.'
        format.html { redirect_to home_url }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

end
