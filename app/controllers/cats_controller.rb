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
    @cat = Cat.find(param[:id])
    render :new
  end

  def destroy

  end

  def show
    @cat = Cat.find(params[:id])
    if @cat
      render :show
    else
      render :json => {:status => "Wrong index for a cat"}
    end
  end
end
