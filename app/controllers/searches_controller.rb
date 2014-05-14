class SearchesController < ApplicationController
  def show
    @query = params[:search][:query]
    @items = ItemSearcher.new(@query).results.order(params[:sort]).paginated(params[:page], 20)
    @reservations = current_user.reservations
  end
end
