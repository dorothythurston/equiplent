class ReminderEmailGenerator
  TIME_BEFORE_WARNING = 2.days

  def send_all_emails
    almost_due_reservations.each do |reservation|
      send_one_email(reservation)
    end
  end

  private

  def send_one_email(reservation)
    ReminderMailer.reservation_due_email(reservation.user).deliver
  end

  def warning_time
    Time.now - TIME_BEFORE_WARNING
  end

  def almost_due_reservations
    Reservation.almost_due(warning_time)
  end
end
