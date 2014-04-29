class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to @item
  end

  def show
    @item = Item.find(params[:id])
    @reservation = Reservation.new(item: @item)
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
    )
  end
end
