class User < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :password
  valid_email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :email_address, :first_name, :last_name, :password, presence: true
  validates :email_address, uniqueness: true, format: { with: valid_email_regex }


end
