class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @box = Box.find(params[:box_id])
    @item = @box.items.build(item_params)
    @item.box_id = @box.id
    if @item.save
      redirect_to box_path(@box)
    else
      render 'new'
    end
  end

  def index
    @box = Box.find(params[:box_id])
    @items = @box.items
  end

  def show
    @box = Box.find(params[:box_id])
    @item = @box.items.find(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :size, :image, :url, :item_ids)
    end

end
