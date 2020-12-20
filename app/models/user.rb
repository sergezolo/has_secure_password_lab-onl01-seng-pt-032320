class User < ApplicationRecord
    has_secure_password

    validates :password, presence: true, confirmation: true
    validates_confirmation_of :password

end
