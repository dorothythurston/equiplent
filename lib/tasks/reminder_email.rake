namespace :reservations do
  desc "Send reminder email to reservers"
  task reminder_email: :environment do
    email_generator = ReminderEmailGenerator.new
    email_generator.send_all_emails
  end
end
