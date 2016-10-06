class BoxesController < ApplicationController

  def index
    @boxes = Box.all
  end

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      # @box.shipped = true
      redirect_to box_path(@box)
    else
      render 'new'
    end
  end

  def show
    @box = Box.find(params[:id])
    @item = Item.new
  end

  def edit
    @box = Box.find(params[:id])
  end

  def update
    @box = Box.find(params[:id])
    @box.shipped = true
    @box.save
    redirect_to boxes_path
  end

  private

    def box_params
      params.require(:box).permit(:title, :date_of_box, :shipped, :subscription_id, :item_ids, items_attributes: [:title, :description, :size])
    end

end
