class ReservationsController < ApplicationController
  respond_to :html

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save(reservation_params)
      redirect_to @reservation.item
    else
      render :new
    end
  end

  def show
    @reservation = find_reservation
  end

  def edit
    @reservation = find_reservation
  end

  def update
    @reservation = find_reservation
    @reservation.update(reservation_params)
    respond_with @reservation
  end

  def destroy
    reservation = find_reservation
    reservation.reservation_status = "closed"
    reservation.save
    redirect_to dashboard_path
  end

  private

  def find_reservation
    current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(
      :item_id,
      :begins_at,
      :ends_at
    ).merge(user_id: current_user.id)
  end
end
