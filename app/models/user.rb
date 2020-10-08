class User < ActiveRecord::Base
    has_secure_password
    has_many :spaceships
    
    validates :username, :email, presence: true
    validates :username, uniqueness: true
end
