class User < ApplicationRecord
  validates_presence_of :name,
                        :street_address,
                        :city,
                        :state,
                        :zip_code,
                        :email,
                        :password,
                        :password_confirmation

  validates_uniqueness_of :email

  has_secure_password
end