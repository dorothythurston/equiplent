class ItemsController < ApplicationController
  respond_to :html

  def index
    @items = Item.paginated(params[:page], 20)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to @item
  end

  def show
    @item = find_item
    @recent_reservations = @item.reservations.recent.paginated(params[:page], 3)
    @reservation = Reservation.new(item: @item)
  end

  def edit
    @item = find_item
  end

  def update
    @item = find_item
    @item.update(item_params)
    respond_with @item
  end

  def destroy
   @item = find_item
   @item.destroy
   redirect_to dashboard_path
  end

  private

  def find_item
    Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name, :url, :category
    )
  end
end
