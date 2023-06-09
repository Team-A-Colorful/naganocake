class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
  
  def genre_search
    @genre = Genre.find(params[:id])
    @items = @genre.items.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

end
