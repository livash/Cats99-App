class CatRentalRequestsController < ApplicationController
  def index

  end

  def new
    @request = CatRentalRequest.new
    @cat = Cat.find(params[:cat_id])
    render :new
  end
  def create
    @cat = Cat.find(params[:cat_id])
    @request = @cat.cat_rental_requests.build(params[:cat_rental_request])
    #@request.status = "approved"
    # @request = CatRentalRequest.new(params[:cat_rental_request])
 #    @request.cat_id = @cat.id
    if @request.save

      redirect_to [@cat, @request]
    else
      render :new
    end
  end

  def show
    @cat = Cat.find(params[:cat_id])
    @request = CatRentalRequest.find(params[:id])
  end

  def destroy
    @cat = Cat.find(params[:cat_id])
    @request = CatRentalRequest.find(params[:id])
    @request.destroy

    redirect_to [@cat]
  end

  def update
    @cat = Cat.find(params[:cat_id])
    @request = CatRentalRequest.find(params[:id])
    if @request.update_attributes(params[:cat_rental_request])
      redirect_to @cat
    end
  end
end
