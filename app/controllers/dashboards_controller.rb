class DashboardsController < ApplicationController
  def show
    @open_reservations = current_user.open_reservations
    @pending_reservations = current_user.pending_reservations
  end
end
