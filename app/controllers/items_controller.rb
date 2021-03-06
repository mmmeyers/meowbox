class ItemsController < ApplicationController

  def new
    @box = Box.find(params[:box_id])
    @item = Item.new
  end

  def create
    @box = Box.find(params[:box_id])
    @item = @box.items.build(item_params)
    @item.box_id = @box.id
    if @item.save
      @box.items << @item
      # redirect_to @box
      render 'items/show', :layout => false # new
      # respond_to do |format| # new
        # format.html { redirect_to box_path(@box), :layout => false } # new changed from render boxes/show
        # format.json { render json: @box, status: 201 } # new changed @item to @box
      # end # new
    else
      render 'boxes/show'
    end
  end


  def index
    @box = Box.find(params[:box_id])
    @items = @box.items
    respond_to do |format|
      format.html {render 'items/index', :layout => false}
      format.json {render json: @items}
    end
  end

  def show
    @box = Box.find(params[:box_id])
    @item = @box.items.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @item }
    end
  end

  def edit
    @box = Box.find(params[:box_id])
    @item = @box.items.find(params[:id])
  end

  def update
    @box = Box.find(params[:box_id])
    @item = @box.items.find(params[:id])
    @item.update_attributes(item_params)
    @item.save
    redirect_to box_path(@box), :notice => "Item updated"
  end

  def destroy
    @box = Box.find(params[:box_id])
    @item = @box.items.find(params[:id])
    @item.destroy
    redirect_to @box, :notice => "Item deleted"
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :size, :photo, :url, :item_ids)
    end

end
