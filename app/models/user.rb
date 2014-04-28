class User < ActiveRecord::Base
  include Clearance::User

  belongs_to :profile, polymorphic: true
end
