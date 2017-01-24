class BeerController < ApplicationController

  def new
    if Beer.where(bid: params[:q]) == []
      search = Search.new
      beer_hash = search.by_bid(params[:q])
      @beer = Beer.new(beer_hash)

      if @beer.save then redirect_to @beer else render :new end
    else
      @beer = Beer.where(bid: params[:q]).first
      redirect_to @beer
    end
  end

  def show
    @beer = Beer.find_by_id(params[:id])
    if @beer.ibu < 50
      @beer.too_bitter = false
    else
      @beer.too_bitter = true
    end
  end

end
