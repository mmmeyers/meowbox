class BoxesController < ApplicationController

  def index
    # @boxes = Box.all
    @subscriptions = Subscription.all

    if !params[:subscription].blank?
      @boxes = Box.by_subscription(params[:subscription]) # .by_subscription comes from the Box model - doesn't have to query the db
    else
      @boxes = Box.page(params[:page])
    end
    render action: :index, layout: request.xhr? == nil
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
    @items = @box.items #- this breaks the box show page, but working now with @item = Item.new 12/7
    # @item = @box.items.build - this breaks the box show page
    @item = Item.new #- original code, keep this and it works
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @box }
    end
  end

  def edit
    @box = Box.find(params[:id])
  end

  def update
    @box = Box.find(params[:id])
    @box.shipped = true
    @box.update_attributes(box_params)
    @box.save
    redirect_to boxes_path, :notice => "Your box was shipped!"
  end

  private

    def box_params
      params.require(:box).permit(:title, :date_of_box, :shipped, :subscription_id, :item_ids, items_attributes: [:title, :description, :size, :url])
    end

end
