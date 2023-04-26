class Public::SearchesController < ApplicationController
  def search
    if params[:name].present?
      @items = Item.where('name LIKE ?', "%#{params[:name]}%").page(params[:page])
    else
      @items = Item.none.page(params[:page])
    end
    @genres = Genre.all
  end
end
