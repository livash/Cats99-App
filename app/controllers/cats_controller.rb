class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def create
    @cat = Cat.new(params[:cat])
    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def destroy
    if Cat.find(params[:id])
      Cat.find(params[:id]).destroy
    end
      redirect_to cats_url
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(params[:cat])
      redirect_to @cat
    end
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end
end
