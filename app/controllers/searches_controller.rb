class SearchesController < ApplicationController
  def show
    @query = params[:search][:query]
    @items = ItemSearcher.new(@query).results.order(params[:sort])
    @reservations = current_user.reservations
  end
end
