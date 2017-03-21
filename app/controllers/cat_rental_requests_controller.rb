class CatRentalRequestsController < ApplicationController

  def index
    @cat_rental_requests = CatRentalRequest.order(:start_date)
    render :index 
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end


end
