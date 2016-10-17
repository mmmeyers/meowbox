class ItemsController < ApplicationController

  def new
    @box = Box.find(params[:box_id])
    @item = Item.new
  end

  def create
    @box = Box.find(params[:box_id])
    @item = @box.items.build(item_params)
    @item.box_id = @box.id
    respond_to do |format|
      if @item.save
        @box.items << @item
        format.html { redirect_to(@box, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @box, :status => :created, :location => @box }
      else
        format.html { render :new }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
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

  def edit
    @box = Box.find(params[:box_id])
    @item = @box.items.find(params[:id])
  end

  def update
    @box = Box.find(params[:box_id])
    @item = @box.items.find(params[:id])
    @item.update_attributes(item_params)
    @item.save
    redirect_to @box, :notice => "Item updated"
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
