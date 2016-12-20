boxes controller:
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



boxes index html pg:
<div class="container-fluid">
  <div id="kittens">
    <%= render 'boxes' %>
  </div>
</div>


<script type="text/javascript" charset="utf-8">
    $(function(){
      $(document).on('click', ".pagination a", function() {
        $.get(this.href, null, null, "script");
        return false;
      });
    });
</script>




boxes index js:
$("#kittens").html("<%= escape_javascript(render('boxes')) %>");




_boxes partial:
<div id="boxes-index>"
  <h4>Our Boxes</h4>
      <ul class="boxes">
        <% @boxes.each do |box| %>
          <% if current_user.try(:admin?) %>
            <li><%= link_to box.title, box_path(box) %>, <%= box.subscription.level %>, created at: <%= box.created_at.strftime("%m/%d/%y") %>, shipped? <%= box.shipped? %></li>
          <% else %>
            <li><%= link_to box.title, box_items_path(box) %> - <%= box.subscription.level %></li>
          <% end %>
        <% end %>
      </ul>

    <%= page_entries_info @boxes %><br>
    <%= paginate @boxes %>

    <p></p>

    <p><%= link_to "Go back", subscriptions_path %></p>
    <% if current_user.try(:admin?) %>
      <p><%= link_to "Create new box", new_box_path %><p>
    <% end %>
</div>
