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
      redirect_to box_path(@box)
    else
      render 'new'
    end
  end

  def show
    @box = Box.find(params[:id])
    @item = Item.new
  end

  private

    def box_params
      params.require(:box).permit(:title, :date_of_box)
    end

end
