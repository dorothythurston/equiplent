class DateChecker < ActiveModel::Validator
  def validate(reservation)
    unless reservation.begins_at.nil? || reservation.ends_at.nil?
      if impossible?(reservation)
        reservation.errors[:reservation] << 'dates not available'
      end
    end
  end

  def impossible?(reservation)
    dates_out_of_order(reservation) || dates_unavailable(reservation)
  end

  private

  def dates_out_of_order(reservation)
    reservation.begins_at > reservation.ends_at
  end

  def dates_unavailable(reservation)
    reservation.
      item.
      reservations.
      where("(begins_at > ? OR ends_at < ?) AND reservation_status <> 'closed' AND id <> ?", reservation.ends_at, reservation.begins_at, reservation.id).
      exists?
  end
end
