require 'date'


class CatsController < ApplicationController

  def age(cat)
    Date.today.year - cat.birth_date.year
  end

  def index
    @cats = Cat.order(:id)
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    cat = Cat.find(params[:id])
    if cat.update(cat_params)
      redirect_to cat_url(cat)
    else
      render json: cat.errors.full_messages, status: unprocessable_entity
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    if cat.destroy
      redirect_to cats_url
    else
      render json: "Can't destroy this cat"
    end
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      redirect_to cat_url(cat)
    else
      render json: cat.errors.full_messages, status: unprocessable_entity
    end
  end

  def cat_params
    params[:cat].permit(:name, :birth_date, :color, :sex, :description)
  end

end
