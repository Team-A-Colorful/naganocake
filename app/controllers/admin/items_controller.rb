class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genres, only: [:index, :new, :edit, :create,:update]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :sale_status)
  end

  def set_genres
    @genres = Genre.all
  end

end
