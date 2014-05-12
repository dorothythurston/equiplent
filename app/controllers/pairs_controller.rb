class PairsController < ApplicationController
  def new
    @items = Item.all
    @pair = Pair.new
  end

  def create
    item = Item.find(params[:pair][:item_id])
    paired_item = Item.find(params[:pair][:pair_item_id])
    item.pair_with(paired_item)
    redirect_to  item
  end

  def destroy
    item.unpair_with(paired_item)
    redirect_to  item
  end

  private

  def paired_item
    Item.find(params[:pair_item_id])
  end

  def item
    Item.find(params[:id])
  end

  def pair_params
    params.require(:pair).permit(
      :item_id,
      :pair_item_id
    )
  end
end
